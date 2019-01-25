using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Control
{
    public partial class Solicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                subValidaciones();
                ASPxGridView1.FilterExpression = "[Estado_ID] = '1'";
                this.ASPxGridView1.ExpandAll();
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

        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if(e.Column.FieldName == "DYR_ID")
            {
                ASPxComboBox lObjPlantilla = e.Editor as ASPxComboBox;
                lObjPlantilla.Callback += LObjPlantilla_Callback;
                if (e.KeyValue != DBNull.Value)
                {
                    int lintCodigoOrganizacion = Convert.ToInt32(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Organizacion_ID"));
                    SubBuscarPlantillas(lObjPlantilla, lintCodigoOrganizacion);
                }
            }
            if (e.Column.FieldName == "Municipio_ID")
            {
                ASPxComboBox lObjMunicipio = e.Editor as ASPxComboBox;
                lObjMunicipio.Callback += LObjMunicipio_Callback;
                if (e.KeyValue != DBNull.Value)
                {
                    int lintCodigoDepartamento = Convert.ToInt32(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Departamento_ID"));
                    SubBuscarMunicipios(lObjMunicipio, lintCodigoDepartamento);
                }
            }
        }

        private void LObjPlantilla_Callback(object sender, CallbackEventArgsBase e)
        {
            SubBuscarPlantillas(sender as ASPxComboBox, Convert.ToInt32(e.Parameter.ToString()));
        }

        private void LObjMunicipio_Callback(object sender, CallbackEventArgsBase e)
        {
            SubBuscarMunicipios(sender as ASPxComboBox, Convert.ToInt32(e.Parameter.ToString()));
        }

        private void SubBuscarPlantillas(ASPxComboBox lCmbPlantilla,int lintCodigoOrganizacion)
        {
            lCmbPlantilla.Items.Clear();
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
               List<TRX_DYR_Plantilla_Encabezado> lObjPlantillas = new List<TRX_DYR_Plantilla_Encabezado>();
                lObjPlantillas = (from p in lObjEntidad.TRX_DYR_Plantilla_Encabezado
                                 where p.Organizacion_ID == lintCodigoOrganizacion
                                 select p).ToList();
                foreach(TRX_DYR_Plantilla_Encabezado lObjPlantilla in lObjPlantillas)
                {
                    lCmbPlantilla.Items.Add(lObjPlantilla.DYR_DSC, lObjPlantilla.DYR_ID);
                }
                if (lCmbPlantilla.Items.Count > 0)
                    lCmbPlantilla.SelectedIndex = 0;
            }
        }

        private void SubBuscarMunicipios(ASPxComboBox lCmbMunicipio, int lintCodigoDepartamento)
        {
            lCmbMunicipio.Items.Clear();
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                List<CAT_STD_Municipio> lObjMunicipios = new List<CAT_STD_Municipio>();
                lObjMunicipios = (from p in lObjEntidad.CAT_STD_Municipio
                                  where p.Departamento_ID == lintCodigoDepartamento
                                  select p).ToList();
                foreach (CAT_STD_Municipio lObjMunicipio in lObjMunicipios)
                {
                    lCmbMunicipio.Items.Add(lObjMunicipio.Municipio_DSC, lObjMunicipio.Municipio_ID);
                }
                if (lCmbMunicipio.Items.Count > 0)
                    lCmbMunicipio.SelectedIndex = 0;
            }
        }

        private void SubEnviarCorreo(string lStrCorreoElectronico, string lStrHtml)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(settings.Smtp.Network.UserName);
            email.To.Add(new MailAddress(lStrCorreoElectronico));
            email.Subject = "ICC - Notificacion";
            email.Body = lStrHtml;
            email.IsBodyHtml = true;
            email.Priority = MailPriority.Normal;
            SmtpClient smtp = new SmtpClient();
            smtp.Credentials = new NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
            smtp.Host = settings.Smtp.Network.Host;
            smtp.Port = settings.Smtp.Network.Port;
            smtp.EnableSsl = true;
            smtp.Send(email);
        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            int lintSolicitudID = Convert.ToInt32(e.NewValues["Solicitud_ID"]);
            using (ICCEntities lObjIcc = new ICCEntities())
            {
                xSpHtml_Result lObjCorreo = new xSpHtml_Result();
                lObjCorreo = lObjIcc.xSpHtml(lintSolicitudID).FirstOrDefault();
                SubEnviarCorreo(lObjCorreo.Correo, lObjCorreo.Html);
            }
            this.ASPxGridView1.DataBind();
        }
    }
}