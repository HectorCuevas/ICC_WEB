using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Control
{
    public partial class General : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                subValidaciones();
                this.dtpFechaInicio.Value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                this.dtpFechaFinal.Value = DateTime.Now;
                this.cmbEstado.SelectedIndex = 0;
                if(User.Identity.Name.Length > 0)
                    Session["XSpUsuario"] = User.Identity.Name;
                else
                    Session["XSpUsuario"] = "*";
                this.GridInforme.DataBind();
                this.SqlData.DataBind();
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

        protected void GridInforme_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.GridInforme.DataBind();
        }

        protected void GridInforme_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSelecionar")
            {
                this.GridInforme.JSProperties.Clear();
                this.GridInforme.JSProperties.Add("cpMuestra", "ControlCalidad.aspx");
                Session["xCodigo"] = Convert.ToString(this.GridInforme.GetRowValues(e.VisibleIndex, "Codigo"));
            }
        }
    }
}