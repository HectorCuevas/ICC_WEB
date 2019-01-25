<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="PuntoMonitoreo.aspx.cs" Inherits="ICC.Reporte.PuntoMonitoreo" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyButkuD66P4-oJ0K90ER3gleqr_OEGBnmo&sensor=false&language=es">
    </script>
    <div class="accountHeader">
        <h2>Reporte Punto de monitoreo</h2>
    </div>
    <hr />
    <div class="panelmaestro">
        <div class="panelopciones">
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblFechaInicio" runat="server" Text="Fecha Inicio">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="dtpFechaInicio" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblFechaFin" runat="server" Text="Fecha Fin">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="dtpFechaFin" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblCuenca" runat="server" Text="Cuenca">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cbxCuenca" runat="server" ValueType="System.String" DataSourceID="SqlDataSourceCuenca" TextField="Cuenca_DSC" ValueField="Cuenca_ID" SelectedIndex="0">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                            cmbSubCuenca.PerformCallback('');
                            }" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblSubCuenca" runat="server" Text="Sub-Cuenca">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cmbSubCuenca" runat="server" ValueType="System.String" DataSourceID="SqlDataSourceSubCuenca" TextField="SubCuencaRio_DSC" ValueField="SubCuencaRio_ID" SelectedIndex="0" ClientInstanceName="cmbSubCuenca" OnCallback="cmbSubCuenca_Callback"></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblGraficaColor" runat="server" Text="Colores Grafica">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cmbColorGrafica" runat="server">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	SubGenerarGrafica(TabPageMap);
}" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblTipoGrafica" runat="server" Text="Tipo Grafica">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cmbTipoGrafica" runat="server">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	SubGenerarGrafica(TabPageMap);
}" />
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblTipoReporte" runat="server" Text="Tipo Reporte">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cmbTipoReporte" ClientInstanceName="cmbTipoReporte" runat="server">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar Reporte" Width="100%" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	SubGenerarData();
}" />
                        </dx:ASPxButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnExcel" runat="server" Text="Exportar Excel" OnClick="btnExcel_Click" Width="100%"></dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panelcontenido">
            <dx:ASPxPageControl ID="TabPageMap" runat="server" ActiveTabIndex="0" Width="100%" ClientInstanceName="TabPageMap">
                <TabPages>
                    <dx:TabPage Text="Información">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <dx:ASPxPivotGrid ID="PivotGrid" runat="server" ClientIDMode="AutoID" ClientInstanceName="PivotGrid" DataSourceID="SqlDataSource" Width="100%" OnCustomJsProperties="PivotGrid_CustomJsProperties" OnCustomCallback="PivotGrid_CustomCallback">
                                    <Fields>
                                        <dx:PivotGridField ID="fieldPuntoMonitoreoDSC" AreaIndex="1" Caption="Punto de Monitoreo" FieldName="PuntoMonitoreo_DSC" Area="ColumnArea">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldModeloMolineteDSC" AreaIndex="0" Caption="Modelo de Molinete" FieldName="ModeloMolinete_DSC" Area="DataArea" Visible="False">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldTipoMedicionDSC" Area="DataArea" AreaIndex="0" Caption="Tipo de Medición" FieldName="TipoMedicion_DSC" Visible="False">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldTipologiaDSC" Area="DataArea" AreaIndex="0" Caption="Tipología" FieldName="Tipologia_DSC" Visible="False">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldCaudal" Area="DataArea" AreaIndex="0" FieldName="Caudal" CellFormat-FormatString="#.##" CellFormat-FormatType="Custom">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldGpsLatitud" Area="DataArea" AreaIndex="6" FieldName="GpsLatitud" Visible="False">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldGpsLongitud" Area="DataArea" AreaIndex="7" FieldName="GpsLongitud" Visible="False">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldFechaHoraInicial" Area="RowArea" AreaIndex="0" FieldName="FechaHoraInicial" Caption="Fecha" ValueFormat-FormatString="d" ValueFormat-FormatType="DateTime">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldMes" AreaIndex="1" FieldName="Mes" Caption="Mes" Area="RowArea">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldAnio" AreaIndex="0" FieldName="Anio" Caption="Año" Area="ColumnArea">
                                        </dx:PivotGridField>
                                        <dx:PivotGridField ID="fieldDia" Area="RowArea" AreaIndex="2" FieldName="Dia">
                                        </dx:PivotGridField>
                                    </Fields>
                                    <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" ShowRowTotals="False" />
                                    <OptionsPager RowsPerPage="0">
                                    </OptionsPager>
                                </dx:ASPxPivotGrid>
                                <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="PivotGrid">
                                </dx:ASPxPivotGridExporter>
                                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpReporte" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Usuario_ID" SessionField="xUsuario" Type="String" />
                                        <asp:ControlParameter ControlID="dtpFechaInicio" DbType="Date" Name="FechaI" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="dtpFechaFin" DbType="Date" Name="FechaF" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="cbxCuenca" Name="Cuenca_ID" PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="cmbSubCuenca" Name="SubCuenca_ID" PropertyName="Value" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="TipoMedicion_ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>                                
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="tgrafica" Text="Grafica">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <dx:WebChartControl ID="WebChart" runat="server" ClientInstanceName="WebChart" CrosshairEnabled="True" Height="480px" OnCustomCallback="WebChart_CustomCallback" Width="700px" DataSourceID="PivotGrid">
                                    <Legend Name="Default Legend"></Legend>
                                </dx:WebChartControl>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="tmapa" Text="Mapa">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div id="myMap" style="position: relative; width: 100%; height: 600px;" />
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <ClientSideEvents ActiveTabChanged="function(s, e) {
SubTabs(s,e);	
}" />
            </dx:ASPxPageControl>
        </div>
    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
    </dx:ASPxLoadingPanel>
    <script src="../Content/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function SubGenerarData() {
            TabPageMap.SetActiveTabIndex(0);
            PivotGrid.PerformCallback(cmbTipoReporte.GetSelectedIndex());
            WebChart.PerformCallback(TabPageMap.GetWidth() - 25);
        }
        function SubTabs(s,e) {
            var lObjTab = e.tab.name;
            switch (lObjTab)
            {
                case 'tgrafica':
                    SubGenerarGrafica(s);
                    break;
                case 'tmapa':
                    SubGenerarMapa();
                    break;
            }
        }
        function SubGenerarGrafica(s) {
            WebChart.PerformCallback(s.GetWidth() - 25);
        }
        function SubGenerarMapa()
        {
            LoadingPanel.ShowInElement(document.getElementById('myMap'));
            LoadingPanel.Show();
            var oJsonGps = PivotGrid.cpGps;
            var oJsonGps_Geografica = eval(oJsonGps);
            var mapOptions = {
                center: new google.maps.LatLng(15, -90.54),
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("myMap"), mapOptions);
            if (oJsonGps_Geografica == null) {
                LoadingPanel.Hide();
                return;
            }
            for (var i = 0; i < oJsonGps_Geografica.length; i++) {
                try{
                    var utm_latitud = oJsonGps_Geografica[i].UTM_Latitud;
                    var utm_longitud = oJsonGps_Geografica[i].UTM_Longitud;
                    var utm_title = oJsonGps_Geografica[i].Descripcion;
                    var myLatlng = new google.maps.LatLng(utm_latitud, utm_longitud);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        title: utm_title
                    });
                    marker.setIcon('../Content/x_map.png');
                    marker.setMap(map);
                    FncMarcaInformacion(map, marker, i, oJsonGps_Geografica);
                }
                catch(ex){
                    alert(ex.Message);
                }
            }
            LoadingPanel.Hide();
        }
        function FncMarcaInformacion(map, marker, index, oJsonGps_Geografica) {
            try {
                var info = 'Cuenca: ' + oJsonGps_Geografica[index].Descripcion;
                var infoWindow = new google.maps.InfoWindow({
                    content: info
                });
                google.maps.event.addListener(marker, 'mouseover', function () {
                    infoWindow.open(map, marker);
                });
                google.maps.event.addListener(marker, 'mouseout', function () {
                    infoWindow.close();
                });
            }
            catch (ex) {
                alert(ex.Message);
            }
        }
    </script>
    <asp:SqlDataSource ID="SqlDataSourceCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpBuscarInformacionCuencaReporte" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Usuario_ID" SessionField="xUsuario" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSubCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_SubCuencaRio] WHERE ([Cuenca_ID] = @Cuenca_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbxCuenca" Name="Cuenca_ID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
