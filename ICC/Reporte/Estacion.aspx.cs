﻿using DevExpress.Web;
using DevExpress.XtraCharts;
using ICC.Recursos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Reporte
{
    public partial class Estacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                subValidaciones();
                this.dtpFechaInicio.Value = FncObtenerFecha();
                this.PivotGrid.DataBind();
                SubCargarConf();
                this.WebChart.SeriesTemplate.ChangeView((ViewType)Enum.Parse(typeof(ViewType), cmbTipoGrafica.SelectedItem.Value.ToString()));
                this.WebChart.PaletteName = cmbColorGrafica.SelectedItem.ToString();
                this.WebChart.DataBind();
            }
        }

        private void SubCargarConf()
        {
            var restrictedTypes = new ViewType[] { ViewType.PolarArea, ViewType.PolarLine, ViewType.SideBySideGantt,
                ViewType.SideBySideRangeBar, ViewType.RangeBar, ViewType.Gantt, ViewType.PolarPoint, ViewType.Stock, ViewType.CandleStick,
                ViewType.Bubble };
            foreach (ViewType type in Enum.GetValues(typeof(ViewType)))
            {
                if (Array.IndexOf<ViewType>(restrictedTypes, type) >= 0)
                {
                    continue;
                }
                this.cmbTipoGrafica.Items.Add(type.ToString());
            }
            this.cmbColorGrafica.Items.AddRange(WebChart.GetPaletteNames());
            this.cmbTipoGrafica.SelectedIndex = 10;
            this.cmbColorGrafica.SelectedIndex = 0;
            this.WebChart.DataBind();
        }

        private DateTime FncObtenerFecha()
        {
            DateTime lObjDate = DateTime.Now;
            using (SqlConnection lSqlCnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ICCConnectionString"].ConnectionString))
            {
                lSqlCnn.Open();
                SqlCommand lSqlCmd = new SqlCommand();
                lSqlCmd.Connection = lSqlCnn;
                lSqlCmd.CommandText = "SELECT TOP 1 * FROM TRX_DYR_Datos_Estacion ORDER BY Fecha DESC";
                using (SqlDataReader lSqlReader = lSqlCmd.ExecuteReader())
                {
                    while (lSqlReader.Read())
                    {
                        lObjDate = Convert.ToDateTime(lSqlReader["Fecha"].ToString());
                    }
                }
            }
            return lObjDate;
        }

        protected void PivotGrid_CustomCallback(object sender, DevExpress.Web.ASPxPivotGrid.PivotGridCustomCallbackEventArgs e)
        {
            this.TabPageMap.ActiveTabIndex = 0;
            this.PivotGrid.DataBind();
        }
        
        protected void PivotGrid_CustomJsProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            e.Properties.Add("cpGps", FncGenerarDataGps());
        }
        
        private string FncGenerarDataGps()
        {
            string xresultado = string.Empty;
            try
            {
                if (this.PivotGrid.RowCount > -1)
                {
                    ASPxGridView xgrid = new ASPxGridView();
                    xgrid.SettingsPager.Mode = GridViewPagerMode.ShowAllRecords;
                    xgrid.DataSource = this.PivotGrid.CreateDrillDownDataSource();
                    xgrid.DataBind();
                    if (xgrid.VisibleRowCount > 0)
                    {
                        List<LMap> lmapas = new List<LMap>();
                        for (int i = 0; i < xgrid.VisibleRowCount; i++)
                        {
                            LMap lmapa = new LMap();                           
                            lmapa.UTM_Latitud = Convert.ToString(xgrid.GetRowValues(i, "GpsLatitud"));
                            lmapa.UTM_Longitud = Convert.ToString(xgrid.GetRowValues(i, "GpsLongitud"));
                            lmapa.Descripcion = "Estación:" + Convert.ToString(xgrid.GetRowValues(i, "Estacion")) + "<br/>" +
                                "Caudal: " + Convert.ToString(xgrid.GetRowValues(i, "Caudal"));
                            lmapas.Add(lmapa);
                            break;
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
        
        protected void WebChart_CustomCallback(object sender, DevExpress.XtraCharts.Web.CustomCallbackEventArgs e)
        {
            try
            {
                if (e.Parameter != this.WebChart.Width.Value.ToString())
                {
                    this.WebChart.Width = Unit.Pixel(Convert.ToInt32(e.Parameter));
                }
                if (this.WebChart.SeriesTemplate.View.ToString() != this.cmbTipoGrafica.SelectedItem.Value.ToString())
                {
                    this.WebChart.SeriesTemplate.ChangeView((ViewType)Enum.Parse(typeof(ViewType), this.cmbTipoGrafica.SelectedItem.Value.ToString()));
                }
                if (this.WebChart.PaletteName != this.cmbColorGrafica.SelectedItem.Value.ToString())
                {
                    this.WebChart.PaletteName = this.cmbColorGrafica.SelectedItem.Value.ToString();
                }
            }
            catch (Exception ex)
            {
                if (this.WebChart.JSProperties.Count > 0)
                {
                    this.WebChart.JSProperties.Clear();
                    this.WebChart.JSProperties.Add("cpex", ex.Message);
                }
                else
                {
                    this.WebChart.JSProperties.Add("cpex", ex.Message);
                }
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

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            this.ASPxPivotGridExporter1.ExportXlsxToResponse("Estacion.xlsx");
        }
    }
}