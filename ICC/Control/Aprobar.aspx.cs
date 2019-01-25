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
    public partial class Aprobar : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                subValidaciones();
                Session["xOrganizacionID"] = "-1";
                this.GridViewCuenca.ExpandAll();
                this.GridViewSecciones.ExpandAll();
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

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            List<object> lObjSolicitudes = GridViewSolicitud.GetSelectedFieldValues("Solicitud_ID");
            List<object> lObjCuencas = GridViewCuenca.GetSelectedFieldValues("Cuenca_ID","SubCuencaRio_ID");
            List<object> lObjSecciones = GridViewSecciones.GetSelectedFieldValues("Seccion_ID","SubSeccion_ID");
            if (lObjSolicitudes.Count > 0)
            {
                if (lObjCuencas.Count > 0 && lObjSecciones.Count > 0)
                {
                    foreach (int lintCodigoSolicitud in lObjSolicitudes)
                    {
                        SubCrearPermiso(lintCodigoSolicitud, lObjCuencas, lObjSecciones);
                    }
                    Response.Redirect("~/Control/Plantilla.aspx.aspx");
                }
            }
        }

        private void SubCrearPermiso(int lintSolicitudID,List<object> lObjCuencas, List<object> lObjSecciones)
        {
            //using (ICCEntities lObjIcc = new ICCEntities())
            //{
            //    TRX_Solicitud lObjSolicitud = new TRX_Solicitud();
            //    lObjSolicitud = (from p in lObjIcc.TRX_Solicitud
            //                     where p.Solicitud_ID == lintSolicitudID
            //                     select p).FirstOrDefault();                
            //    if (lObjSolicitud != null)
            //    {
            //        string lStrHtml = string.Empty;
            //        lStrHtml = lObjIcc.xSpHtml(lObjSolicitud.Solicitud_ID).FirstOrDefault();
            //        lObjSolicitud.Estado_ID = 2;
            //        foreach (object[] lObjCuenca in lObjCuencas)
            //        {
            //            TRX_Solicitud_Detalle_Cuenca lObjSolicitudCuenca = new TRX_Solicitud_Detalle_Cuenca();
            //            lObjSolicitudCuenca.Solicitud_ID = lintSolicitudID;
            //            lObjSolicitudCuenca.Cuenca_ID = Convert.ToInt32(lObjCuenca[0]);
            //            lObjSolicitudCuenca.SubCuentaRio_ID = Convert.ToInt32(lObjCuenca[1]);
            //            lObjIcc.TRX_Solicitud_Detalle_Cuenca.Add(lObjSolicitudCuenca);
            //        }
            //        foreach (object[] lObjSeccion in lObjSecciones)
            //        {
            //            TRX_Solicitud_Detalle_Seccion lObjSolicitudSeccion = new TRX_Solicitud_Detalle_Seccion();
            //            lObjSolicitudSeccion.Solicitud_ID = lintSolicitudID;
            //            lObjSolicitudSeccion.Seccion_ID = Convert.ToInt32(lObjSeccion[0]);
            //            lObjSolicitudSeccion.SubSeccion_ID = Convert.ToInt32(lObjSeccion[1]);
            //            lObjIcc.TRX_Solicitud_Detalle_Seccion.Add(lObjSolicitudSeccion);
            //        }
            //        lObjIcc.SaveChanges();
            //        SubEnviarCorreo(lObjSolicitud.CorreoElectronico, lStrHtml);
            //    }
            //}
        }

        private void SubEnviarCorreo(string lStrCorreoElectronico,string lStrHtml)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(settings.Smtp.Network.UserName);
            email.To.Add(new MailAddress(lStrCorreoElectronico));
            email.Subject = "ICC - Solicitud Aprobada";
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

        private void SubCargarPlantilla(int pCodigoPlantilla)
        {
            GridViewCuenca.Selection.UnselectAll();
            GridViewSecciones.Selection.UnselectAll();
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                List<TRX_DYR_Plantilla_Detalle_Cuenca> lObjCuencas = new List<TRX_DYR_Plantilla_Detalle_Cuenca>();
                List<TRX_DYR_Plantilla_Detalle_Seccion> lObjSecciones = new List<TRX_DYR_Plantilla_Detalle_Seccion>();
                lObjCuencas = (from p in lObjEntidad.TRX_DYR_Plantilla_Detalle_Cuenca
                               where p.DYR_ID == pCodigoPlantilla
                               select p).ToList();
                lObjSecciones = (from p in lObjEntidad.TRX_DYR_Plantilla_Detalle_Seccion
                               where p.DYR_ID == pCodigoPlantilla
                               select p).ToList();
                foreach (TRX_DYR_Plantilla_Detalle_Cuenca lObjCuenca in lObjCuencas)
                {
                    GridViewCuenca.Selection.SetSelectionByKey(lObjCuenca.SubCuentaRio_ID, true);
                }
                foreach (TRX_DYR_Plantilla_Detalle_Seccion lObjSeccion in lObjSecciones)
                {
                    GridViewSecciones.Selection.SetSelectionByKey(lObjSeccion.SubSeccion_ID, true);
                }
            }
        }

        protected void ASPxFormLayout1_E2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ASPxFormLayout1_E2.SelectedItem != null)
                Session["xOrganizacionID"] = ASPxFormLayout1_E2.SelectedItem.Value.ToString();
        }

        protected void ASPxFormLayout1_E4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ASPxFormLayout1_E4.SelectedItem != null)
            {
                SubCargarPlantilla(Convert.ToInt32(ASPxFormLayout1_E4.SelectedItem.Value));
            }
            else
            {
                GridViewCuenca.Selection.UnselectAll();
                GridViewSecciones.Selection.UnselectAll();
            }
        }

    }
}