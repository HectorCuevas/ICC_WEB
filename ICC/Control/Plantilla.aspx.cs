using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Control
{
    public partial class Plantilla : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                subValidaciones();
            }
        }

        private void subValidaciones()
        {
            string lS = Path.GetFileName(Request.PhysicalPath);
            using (ICCEntities lobjEntidad = new ICCEntities())
            {
                int lintPermite = lobjEntidad.xSPAccesos(Path.GetFileName(Request.PhysicalPath), User.Identity.Name).FirstOrDefault().Value;
                if (lintPermite == 0)
                    Response.Redirect("~/Validaciones.aspx");
            }
        }


        protected void ASPxGridViewPlantillaEncabezado_DetailRowExpandedChanged(object sender, DevExpress.Web.ASPxGridViewDetailRowEventArgs e)
        {
            if (e.Expanded)
            {
                Session["DYR_ID"] = this.ASPxGridViewPlantillaEncabezado.GetRowValues(e.VisibleIndex, "DYR_ID");
                Session["ID"] = e.VisibleIndex;
                SubCargarCuencas();
                SubCargarSecciones();
            }
        }

        private void SubCargarCuencas()
        {
            int lintIndice = Convert.ToInt32(Session["ID"]);
            int lintCodigo = Convert.ToInt32(Session["DYR_ID"]);
            ASPxPageControl lObjTab = (ASPxPageControl)ASPxGridViewPlantillaEncabezado.FindDetailRowTemplateControl(lintIndice, "ASPxPageControlPlantilla");
            ASPxGridView lObjGridViewCuenca = (ASPxGridView)lObjTab.FindControl("ASPxGridViewCuenca");
            lObjGridViewCuenca.Selection.UnselectAll();
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                List<TRX_DYR_Plantilla_Detalle_Cuenca> lObjCuencas = new List<TRX_DYR_Plantilla_Detalle_Cuenca>();
                lObjCuencas = (from p in lObjEntidad.TRX_DYR_Plantilla_Detalle_Cuenca
                               where p.DYR_ID == lintCodigo
                               select p).ToList();
                foreach (TRX_DYR_Plantilla_Detalle_Cuenca lObjCuenca in lObjCuencas)
                {
                    lObjGridViewCuenca.Selection.SelectRowByKey(lObjCuenca.SubCuentaRio_ID);
                }
            }           
        }

        private void SubCargarSecciones()
        {
            int lintIndice = Convert.ToInt32(Session["ID"]);
            int lintCodigo = Convert.ToInt32(Session["DYR_ID"]);
            ASPxPageControl lObjTab = (ASPxPageControl)ASPxGridViewPlantillaEncabezado.FindDetailRowTemplateControl(lintIndice, "ASPxPageControlPlantilla");
            ASPxGridView lObjGridViewSeccion = (ASPxGridView)lObjTab.FindControl("ASPxGridViewSeccion");
            lObjGridViewSeccion.Selection.UnselectAll();
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                List<TRX_DYR_Plantilla_Detalle_Seccion> lObjSecciones = new List<TRX_DYR_Plantilla_Detalle_Seccion>();
                lObjSecciones = (from p in lObjEntidad.TRX_DYR_Plantilla_Detalle_Seccion
                                 where p.DYR_ID == lintCodigo
                                 select p).ToList();
                foreach (TRX_DYR_Plantilla_Detalle_Seccion lObjSeccion in lObjSecciones)
                {
                    lObjGridViewSeccion.Selection.SelectRowByKey(lObjSeccion.SubSeccion_ID);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SubGuardarPlantilla();
        }

        private void SubGuardarPlantilla()
        {
            int lintIndice = Convert.ToInt32(Session["ID"]);
            int lintDYR_ID = Convert.ToInt32(Session["DYR_ID"]);
            string lStrCuencas = string.Empty;
            string lStrSecciones = string.Empty;
            ASPxPageControl lObjPageControl = (ASPxPageControl)ASPxGridViewPlantillaEncabezado.FindDetailRowTemplateControl(lintIndice, "ASPxPageControlPlantilla");
            ASPxGridView lObjGridViewCuenca = (ASPxGridView)lObjPageControl.FindControl("ASPxGridViewCuenca");
            ASPxGridView lObjGridViewSeccion = (ASPxGridView)lObjPageControl.FindControl("ASPxGridViewSeccion");
            List<object> lObjCuencas = lObjGridViewCuenca.GetSelectedFieldValues("SubCuencaRio_ID");
            List<object> lObjSecciones = lObjGridViewSeccion.GetSelectedFieldValues("SubSeccion_ID");
            foreach (object lObjCuenca in lObjCuencas)
            {
                lStrCuencas += lObjCuenca.ToString() + ",";
            }
            foreach (object lObjSeccion in lObjSecciones)
            {
                lStrSecciones += lObjSeccion.ToString() + ",";
            }
            if(lStrCuencas.Length > 0)
                lStrCuencas = lStrCuencas.Substring(0, lStrCuencas.Length - 1);
            if(lStrSecciones.Length > 0)
                lStrSecciones = lStrSecciones.Substring(0, lStrSecciones.Length - 1);
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                lObjEntidad.xSpCrearPlantilla(lintDYR_ID, lStrCuencas, lStrSecciones);
                lObjEntidad.SaveChanges();
            }
        }

    }
}