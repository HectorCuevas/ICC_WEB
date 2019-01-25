using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Cuenta
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxFormLayout1_E8_Click(object sender, EventArgs e)
        {
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                TRX_Solicitud lObjSolicitud = new TRX_Solicitud();
                lObjSolicitud = (from p in lObjEntidad.TRX_Solicitud
                                 where p.CorreoElectronico == ASPxFormLayout1_E2.Text && p.Contrasena == ASPxFormLayout1_E4.Text
                                 select p).FirstOrDefault();
                if (lObjSolicitud != null)
                {
                    FormsAuthentication.SetAuthCookie(ASPxFormLayout1_E2.Text, true);
                    SubCrearCookiePermisos(ASPxFormLayout1_E2.Text);
                    Response.Redirect("~/Contenido/index.html");
                }
            }
        }

        private void SubCrearCookiePermisos(string lStrCorreoElectronico)
        {
            using (ICCEntities lObjIcc = new ICCEntities())
            {
                HttpCookie lObjCookie = Request.Cookies["cObjPermisos"];
                if (lObjCookie == null)
                    lObjCookie = new HttpCookie("cObjPermisos");                
                lObjCookie.Value = JsonConvert.SerializeObject(lObjIcc.xSPPermisos(lStrCorreoElectronico).ToList()); ;
                lObjCookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(lObjCookie);
            }
        }

        protected void ASPxFormLayout1_E10_Click(object sender, EventArgs e)
        {
            ASPxFormLayout1_E2.Text = string.Empty;
            ASPxFormLayout1_E4.Text = string.Empty;
        }

        protected void ASPxFormLayout1_E7_Click(object sender, EventArgs e)
        {
            using (ICCEntities lObjIcc = new ICCEntities())
            {
                xSpHtmlRecuperacion_Result lObjCorreo = new xSpHtmlRecuperacion_Result();
                lObjCorreo = lObjIcc.xSpHtmlRecuperacion(ASPxFormLayout1_E2.Text).FirstOrDefault();
                if(lObjCorreo != null)
                    SubEnviarCorreo(lObjCorreo.Correo, lObjCorreo.Html);
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
    }
}