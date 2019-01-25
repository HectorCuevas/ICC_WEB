using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Catalogo
{
    public partial class InformeMonitoreo : System.Web.UI.Page
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

        protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if(e.ButtonID == "btnMostrar")
            {
                string lStrArchivo = this.ASPxGridView1.GetRowValues(e.VisibleIndex, "CodigoBoletin").ToString() + "/" +
                    this.ASPxGridView1.GetRowValues(e.VisibleIndex, "NombreArchivo").ToString();
                ASPxGridView1.JSProperties.Clear();
                ASPxGridView1.JSProperties.Add("cpBoletin", lStrArchivo);
            }
        }
    }
}