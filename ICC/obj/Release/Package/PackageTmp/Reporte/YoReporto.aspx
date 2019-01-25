<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="YoReporto.aspx.cs" Inherits="ICC.Reporte.YoReporto" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyButkuD66P4-oJ0K90ER3gleqr_OEGBnmo&sensor=false&language=es">
    </script>
    <div class="accountHeader">
        <h2>Reporte Yo Reporto</h2>
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
                        <dx:ASPxDateEdit ID="dtpFechaInicio" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
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
                        <dx:ASPxDateEdit ID="dtpFechaFin" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                        </dx:ASPxDateEdit>
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
                        <dx:ASPxButton ID="btnExcel" runat="server" Text="Exportar Excel" Width="100%"></dx:ASPxButton>
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
                                <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" OnCustomCallback="ASPxGridView1_CustomCallback" OnCustomJSProperties="ASPxGridView1_CustomJSProperties">
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsSearchPanel Visible="True" />
                                    <Columns>
                                        <dx:GridViewDataDateColumn FieldName="FechaHoraInicial" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Telefono" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Correo" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="TipoReporte_DSC" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Departamento_DSC" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Municipio_DSC" ShowInCustomizationForm="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Barrio" ShowInCustomizationForm="True" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Direccion" ShowInCustomizationForm="True" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Comentarios" ShowInCustomizationForm="True" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="GpsLatitud" ShowInCustomizationForm="True" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="GpsLongitud" ShowInCustomizationForm="True" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpYoReportoReporte" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dtpFechaInicio" DbType="Date" Name="FechaI" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="dtpFechaFin" DbType="Date" Name="FechaF" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
            ASPxGridView1.PerformCallback(0);
        }
        function SubTabs(s,e) {
            var lObjTab = e.tab.name;
            switch (lObjTab)
            {
                case 'tmapa':
                    SubGenerarMapa();
                    break;
            }
        }
        function SubGenerarMapa()
        {
            LoadingPanel.ShowInElement(document.getElementById('myMap'));
            LoadingPanel.Show();
            var oJsonGps = ASPxGridView1.cpGps;
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
                var info = 'Yo Reporto: ' + oJsonGps_Geografica[index].Descripcion;
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
</asp:Content>
