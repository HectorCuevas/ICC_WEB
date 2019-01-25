using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Control
{
    public partial class ControlCalidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                subValidaciones();
                if (Session["xCodigo"] == null)
                    Response.Redirect("~/Control/General.aspx");
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

        protected void GridEstado_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnCambiar")
            {
                int lintCodigoEstado = Convert.ToInt32(this.GridEstado.GetRowValues(e.VisibleIndex, "Estado_ID"));                
                this.GridEstado.JSProperties.Clear();
                this.GridEstado.JSProperties.Add("cpMuestra", "General.aspx");
                if (lintCodigoEstado > -1)
                {
                    Guid lGuid = new Guid(Session["xCodigo"].ToString());
                    using (ICCEntities lObjEntidad = new ICCEntities())
                    {
                        TRX_DYR_Movil lObjMovil = new TRX_DYR_Movil();
                        lObjMovil = (from p in lObjEntidad.TRX_DYR_Movil
                                     where p.Codigo == lGuid
                                     select p).FirstOrDefault();
                        if (lObjMovil != null)
                        {
                            lObjMovil.Estado_ID = Convert.ToInt32(this.GridEstado.GetRowValues(e.VisibleIndex, "Estado_ID"));
                            lObjEntidad.SaveChanges();
                        }
                    }
                }
            }
        }

    }
}