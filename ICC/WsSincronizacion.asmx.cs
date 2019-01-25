using ICC.Recursos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;

namespace ICC
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class WsSincronizacion : System.Web.Services.WebService
    {
        [WebMethod]
        public string FncObtenerDatos()
        {
            List<CAT_Plantilla_Movil> lObjMoviles = new List<CAT_Plantilla_Movil>();
            string lJsonEnvio = string.Empty;
            using (SqlConnection lSqlCnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ICCConnectionString"].ConnectionString))
            {
                lSqlCnn.Open();
                SqlCommand lSqlCmd = new SqlCommand();
                lSqlCmd.Connection = lSqlCnn;
                lSqlCmd.CommandText = "EXEC xSpBuscarInformacionMovil";
                using (SqlDataReader lSqlReader = lSqlCmd.ExecuteReader())
                {
                    while (lSqlReader.Read())
                    {
                        lObjMoviles.Add(
                            new CAT_Plantilla_Movil()
                            {
                                Tabla = lSqlReader["Tabla"].ToString(),
                                Prefijo = lSqlReader["Prefijo"].ToString(),
                                Descripcion = lSqlReader["Descripcion"].ToString(),
                                Orden = Convert.ToInt32(lSqlReader["Orden"].ToString())
                            }
                            );
                    }
                }
                lJsonEnvio = JsonConvert.SerializeObject(lObjMoviles);
            }
            return lJsonEnvio;
        }
        
        [WebMethod]
        public string SubGuardarInformacion(string lJsonTransaccion)
        {
            string lObjException = string.Empty;
            byte[] lObjJsonBit = null;
            try
            {
                lObjJsonBit = System.Convert.FromBase64String(lJsonTransaccion);                
                List<IccTran> lObjEnvios = JsonConvert.DeserializeObject<List<IccTran>>(System.Text.Encoding.UTF8.GetString(lObjJsonBit));
                SubGuardarTransaccion(lObjEnvios);
                lObjException = string.Empty;
            }
            catch (Exception ex)
            {
                lJsonTransaccion = System.Text.Encoding.UTF8.GetString(lObjJsonBit);
                lObjException = ex.Message;
                if (ex.InnerException != null)
                    lObjException = ex.Message + " - " + ex.InnerException.Message;
                SubGuardarInformacionJson(lObjException, lJsonTransaccion);
                SubEnviarMensajeExcepcion(lObjException, lJsonTransaccion);
            }
            return lObjException;
        }

        private void SubGuardarTransaccion(List<IccTran> lObjEnvios)
        {
            xSpBuscarInformacionCuenca_Result lObjSpIcc = new xSpBuscarInformacionCuenca_Result();
            IccEnvio lObjMovil = new IccEnvio();
            TRX_DYR_Movil_Detalle lObjMovilDet = new TRX_DYR_Movil_Detalle();
            List<TRX_DYR_Movil_Detalle> lObjMovilDets = new List<TRX_DYR_Movil_Detalle>();
            foreach (IccTran lObjEnvio in lObjEnvios)
            {
                using (ICCEntities lObjIcc = new ICCEntities())
                {
                    lObjMovil = new IccEnvio();
                    lObjMovil = JsonConvert.DeserializeObject<IccEnvio>(lObjEnvio.JsonTran);
                    lObjSpIcc = new xSpBuscarInformacionCuenca_Result();
                    lObjSpIcc = lObjIcc.xSpBuscarInformacionCuenca(lObjMovil.lobjEnce.Codigo.ToString(), lObjMovil.lobjEnce.Cuenca, lObjMovil.lobjEnce.SubCuenca, lObjMovil.lobjEnce.PuntoMonitoreo,
                        lObjMovil.lobjEnce.ModeloMolinete, lObjMovil.lobjEnce.TipoMedicion, lObjMovil.lobjEnce.Tipologia, lObjMovil.lobjEnce.Estado).FirstOrDefault();
                    //Validando Excepcion
                    if (lObjMovil.lobjEnce.Usuario == null)
                        return;
                    if (lObjSpIcc == null)
                        throw new Exception(string.Format("Envio de: {0} - No se encontraron datos a comprar en servidor central.", lObjMovil.lobjEnce.Usuario));
                    if(lObjSpIcc.Cuenca_ID == null) //CUENCA
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Cuenca: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario, lObjMovil.lobjEnce.Cuenca));
                    if (lObjSpIcc.SubCuencaRio_ID == null) //SUB CUENCA
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Sub Cuenca: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario,lObjMovil.lobjEnce.SubCuenca));
                    if (lObjSpIcc.PuntoMonitoreo_ID == null) //PUNTO MONITOREO
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Punto Monitoreo cuenca: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario,lObjMovil.lobjEnce.PuntoMonitoreo));
                    if (lObjSpIcc.ModeloMolinete_ID == null) //MODELO MOLINETE
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Modelo Molinete: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario,lObjMovil.lobjEnce.ModeloMolinete));
                    if (lObjSpIcc.TipoMedicion_ID == null) //TIPO DE MEDICION
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Tipo Medición: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario,lObjMovil.lobjEnce.TipoMedicion));
                    if (lObjSpIcc.Tipologia_ID == null)//TIPOLOGIA
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Tipología: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario,lObjMovil.lobjEnce.Tipologia));
                    if (lObjSpIcc.Estado_ID == null) //ESTADO
                        throw new Exception(string.Format("Envio de: {0} - Búsqueda de información Estado: {1} no encontrado en servidor central.", lObjMovil.lobjEnce.Usuario, lObjMovil.lobjEnce.Estado));
                    //Guardar Transaccion
                    TRX_DYR_Movil lObjMovilEnc = new TRX_DYR_Movil();
                    lObjMovilEnc.Codigo = lObjMovil.lobjEnce.Codigo;
                    lObjMovilEnc.Cuenca_ID = lObjSpIcc.Cuenca_ID.Value;
                    lObjMovilEnc.SubCuencaRio_ID = lObjSpIcc.SubCuencaRio_ID.Value;
                    lObjMovilEnc.PuntoMonitoreo_ID = lObjSpIcc.PuntoMonitoreo_ID.Value;
                    lObjMovilEnc.ModeloMolinete_ID = lObjSpIcc.ModeloMolinete_ID.Value;
                    lObjMovilEnc.TipoMedicion_ID = lObjSpIcc.TipoMedicion_ID.Value;
                    lObjMovilEnc.Tipologia_ID = lObjSpIcc.Tipologia_ID.Value;
                    lObjMovilEnc.FechaHoraInicial = lObjMovil.lobjEnce.FechaHoraInicial;
                    lObjMovilEnc.FechaHoraFinal = lObjMovil.lobjEnce.FechaHoraFinal;
                    lObjMovilEnc.GpsLatitud = lObjMovil.lobjEnce.GpsLatitud;
                    lObjMovilEnc.GpsLongitud = lObjMovil.lobjEnce.GpsLongitud;
                    lObjMovilEnc.FotografiaNorte = lObjMovil.lobjEnce.ImagenNorte;
                    lObjMovilEnc.FotografiaSur = lObjMovil.lobjEnce.ImagenSur;
                    lObjMovilEnc.Comentario = lObjMovil.lobjEnce.Comentario;
                    lObjMovilEnc.Estado_ID = lObjSpIcc.Estado_ID.Value;
                    lObjMovilEnc.Usuario = lObjMovil.lobjEnce.Usuario;
                    lObjMovilEnc.Caudal = lObjMovil.lobjEnce.Caudal;
                    lObjMovilDets = new List<TRX_DYR_Movil_Detalle>();
                    foreach (cTransaccionDet lObjTranDet in lObjMovil.lObjDet)
                    {
                        lObjMovilDet = new TRX_DYR_Movil_Detalle();
                        lObjMovilDet.Codigo = lObjTranDet.Codigo;
                        lObjMovilDet.NoCorrelativo = lObjTranDet.NoCorrelativo;
                        lObjMovilDet.MedicionBaseInicial = lObjTranDet.MedicionBaseInicial;
                        lObjMovilDet.MedicionBaseFinal = lObjTranDet.MedicionBaseFinal;
                        lObjMovilDet.SectorMetros = lObjTranDet.SectorMetros;
                        lObjMovilDet.Area = lObjTranDet.Area;
                        lObjMovilDet.Revoluciones = lObjTranDet.Revoluciones;
                        lObjMovilDet.Velocidad = lObjTranDet.Velocidad;
                        lObjMovilDet.Caudal = lObjTranDet.Caudal;
                        lObjMovilDets.Add(lObjMovilDet);
                    }
                    lObjIcc.TRX_DYR_Movil.Add(lObjMovilEnc);
                    foreach (TRX_DYR_Movil_Detalle lObjTranDet in lObjMovilDets)
                    {
                        lObjIcc.TRX_DYR_Movil_Detalle.Add(lObjTranDet);
                    }
                    lObjIcc.SaveChanges();
                }
            }
        }
        
        [WebMethod]
        public string SubGuardarInformacionYoReporto(string lJsonTransaccion)
        {
            string lJsonEnvio = string.Empty;

            string lObjException = string.Empty;
            byte[] lObjJsonBit = null;
            try
            {
                lObjJsonBit = System.Convert.FromBase64String(lJsonTransaccion);
                List<IccReporte> lObjEnvioIcc = JsonConvert.DeserializeObject<List<IccReporte>>(System.Text.Encoding.UTF8.GetString(lObjJsonBit));
                SubGuardarTransaccionYoReporto(lObjEnvioIcc);
                lObjException = string.Empty;
            }
            catch (Exception ex)
            {
                lJsonTransaccion = System.Text.Encoding.UTF8.GetString(lObjJsonBit);
                lObjException = ex.Message;
                if (ex.InnerException != null)
                    lObjException = ex.Message + " - " + ex.InnerException.Message;
                SubGuardarInformacionYoReportoJson(lObjException, lJsonTransaccion);
                SubEnviarMensajeExcepcion(lObjException, lJsonTransaccion);
            }
            return lObjException;
        }

        private void SubGuardarTransaccionYoReporto(List<IccReporte> lObjTranes)
        {
            using (ICCEntities lObjIcc = new ICCEntities())
            {
                YoReporto lObjReporte = new YoReporto();
                TRX_DYR_Movil_YoReporto lObjMovilEnc = new TRX_DYR_Movil_YoReporto();
                xSpBuscarInformacionYoReporto_Result lObjSpIcc = new xSpBuscarInformacionYoReporto_Result();
                foreach (IccReporte lObjTran in lObjTranes)
                {
                    lObjReporte = new YoReporto();
                    lObjReporte = JsonConvert.DeserializeObject<YoReporto>(lObjTran.JsonTran);
                    lObjSpIcc = new xSpBuscarInformacionYoReporto_Result();
                    lObjSpIcc = lObjIcc.xSpBuscarInformacionYoReporto(lObjReporte.TipoReporte, lObjReporte.Departamento, lObjReporte.Municipio).FirstOrDefault();
                    if (lObjSpIcc == null)
                        throw new Exception("La información enviada no coincide, favor de revisar los catálogos.");
                    lObjMovilEnc = new TRX_DYR_Movil_YoReporto();
                    lObjMovilEnc.Codigo = lObjReporte.Codigo;
                    lObjMovilEnc.FechaHoraInicial = lObjReporte.FechaHoraInicial;
                    lObjMovilEnc.Usuario = lObjReporte.Usuario;
                    lObjMovilEnc.Nombre = lObjReporte.Nombre;
                    lObjMovilEnc.Telefono = lObjReporte.Telefono;
                    lObjMovilEnc.Correo = lObjReporte.Correo;
                    lObjMovilEnc.TipoReporte_ID = lObjSpIcc.TipoReporte_ID.Value;
                    lObjMovilEnc.Departamento_ID = lObjSpIcc.Departamento_ID.Value;
                    lObjMovilEnc.Municipio_ID = lObjSpIcc.Municipio_ID.Value;
                    lObjMovilEnc.Barrio = lObjReporte.Barrio;
                    lObjMovilEnc.Direccion = lObjReporte.Direccion;
                    lObjMovilEnc.Comentarios = lObjReporte.Comentarios;
                    lObjMovilEnc.GpsLatitud = lObjReporte.GpsLatitud;
                    lObjMovilEnc.GpsLongitud = lObjReporte.GpsLongitud;
                    lObjMovilEnc.Imagen = lObjReporte.Imagen;
                    lObjMovilEnc.Emei = lObjReporte.Emei;
                    lObjIcc.TRX_DYR_Movil_YoReporto.Add(lObjMovilEnc);
                    lObjIcc.SaveChanges();
                }
            }
        }

        private void SubGuardarInformacionJson(string lStrAsunto, string lJsontransaccion)
        {
            using (SqlConnection lSqlCnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ICCConnectionString"].ConnectionString))
            {
                lSqlCnn.Open();
                SqlCommand lSqlCmd = new SqlCommand();
                lSqlCmd.Connection = lSqlCnn;
                lSqlCmd.CommandText = string.Format("EXEC xSpGuardarInformacionJson '{0}','{1}'", lStrAsunto, lJsontransaccion);
                lSqlCmd.ExecuteNonQuery();
                lSqlCnn.Close();
            }
        }

        private void SubGuardarInformacionYoReportoJson(string lStrAsunto, string lJsontransaccion)
        {
            using (SqlConnection lSqlCnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ICCConnectionString"].ConnectionString))
            {
                lSqlCnn.Open();
                SqlCommand lSqlCmd = new SqlCommand();
                lSqlCmd.Connection = lSqlCnn;
                lSqlCmd.CommandText = string.Format("EXEC xSpGuardarInformacionJson '{0}','{1}'", lStrAsunto, lJsontransaccion);
                lSqlCmd.ExecuteNonQuery();
                lSqlCnn.Close();
            }
        }

        private void SubEnviarMensajeExcepcion(string lStrAsunto,string lJsontransaccion)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            MailSettingsSectionGroup settings = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(settings.Smtp.Network.UserName);
            email.To.Add(new MailAddress(settings.Smtp.Network.UserName));
            email.Subject = lStrAsunto;
            email.Body = lJsontransaccion;
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
