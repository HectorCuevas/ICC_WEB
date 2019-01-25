using DevExpress.Web;
using DevExpress.XtraCharts;
using ICC.Recursos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Reporte
{
    public partial class YoReporto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                subValidaciones();
                this.dtpFechaInicio.Value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                this.dtpFechaFin.Value = DateTime.Now;
            }
        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            this.TabPageMap.ActiveTabIndex = 0;
            this.ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
        {
            e.Properties.Add("cpGps", FncGenerarDataGps());
        }

        private string FncGenerarDataGps()
        {
            string xresultado = string.Empty;
            try
            { 
                if (ASPxGridView1.VisibleRowCount > -1)
                {
                    if (ASPxGridView1.VisibleRowCount > 0)
                    {
                        List<LMap> lmapas = new List<LMap>();
                        for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
                        {
                            LMap lmapa = new LMap();                           
                            lmapa.UTM_Latitud = Convert.ToString(ASPxGridView1.GetRowValues(i, "GpsLatitud"));
                            lmapa.UTM_Longitud = Convert.ToString(ASPxGridView1.GetRowValues(i, "GpsLongitud"));
                            lmapa.Descripcion = "Tipo Reporte:" + Convert.ToString(ASPxGridView1.GetRowValues(i, "TipoReporte_DSC")) + "<br/>" +
                                "Departamento:" + Convert.ToString(ASPxGridView1.GetRowValues(i, "Departamento_DSC")) + "<br/>" +
                                "Municipio:" + Convert.ToString(ASPxGridView1.GetRowValues(i, "Municipio_DSC")) + "<br/>" +
                                "Fecha:" + Convert.ToString(ASPxGridView1.GetRowValues(i, "FechaHoraInicial")) + "<br/>" +
                                "Comentarios:" + Convert.ToString(ASPxGridView1.GetRowValues(i, "Comentarios"));
                            lmapas.Add(lmapa);
                        }
                        if (lmapas.Count > 0)
                        {
                            xresultado = JsonConvert.SerializeObject(lmapas);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                xresultado = ex.Message;
                xresultado = string.Empty;
            }
            return xresultado;
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
    }
}