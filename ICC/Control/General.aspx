<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="General.aspx.cs" Inherits="ICC.Control.General" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
        <h2>Informe General ICC</h2>
    </div>
    <hr />
    <div>
        <div class="panelmaestro">
             <div class="panelopciones">
                <table>
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="lblFechaInicio" runat="server" Text="Fecha Inicio:">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxDateEdit ID="dtpFechaInicio" runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="lblFechaFin" runat="server" Text="Fecha Fin:">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxDateEdit ID="dtpFechaFinal" runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" UseMaskBehavior="True">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                         <td>
                            <dx:ASPxLabel ID="lblEstado" runat="server" Text="Estado:">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxComboBox ID="cmbEstado" runat="server" DataSourceID="SqlDataEstado" TextField="Estado_DSC" ValueField="Estado_ID">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataEstado" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Estado] ORDER BY [Estado_ID]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnGenerar" runat="server" Text="Ver Informe" AutoPostBack="False" EnableClientSideAPI="True" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	        GridInforme.PerformCallback('');
        }" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panelcontenido">
        <dx:ASPxGridView ID="GridInforme" ClientInstanceName="GridInforme" runat="server" AutoGenerateColumns="False" DataSourceID="SqlData" OnCustomButtonCallback="GridInforme_CustomButtonCallback" OnCustomCallback="GridInforme_CustomCallback" Width="100%">
            <ClientSideEvents EndCallback="function(s, e) {
	if(s.cpMuestra != null){
		window.location.href = s.cpMuestra; 
	}
}" />
            <SettingsPager Mode="ShowAllRecords" PageSize="0">
            </SettingsPager>
            <Settings ShowGroupPanel="True" ShowFilterRow="True" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Codigo" VisibleIndex="1" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cuenca" FieldName="Cuenca_DSC" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="SubCuenca Rio" FieldName="SubCuencaRio_DSC" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Punto Monitoreo" FieldName="PuntoMonitoreo_DSC" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Medicion" FieldName="TipoMedicion_DSC" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipologia" FieldName="Tipologia_DSC" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Duracion" FieldName="Duracion" ReadOnly="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Comentario" FieldName="Comentario" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" VisibleIndex="0" ShowClearFilterButton="True">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnSelecionar">
                            <Image IconID="zoom_zoom_16x16">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="Fecha" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="d">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Usuario" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Estado" FieldName="Estado_DSC" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Caudal" FieldName="Caudal" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpListadoGeneral" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="dtpFechaInicio" DbType="Date" Name="pFechaI" PropertyName="Value" />
                <asp:ControlParameter ControlID="dtpFechaFinal" DbType="Date" Name="pFechaF" PropertyName="Value" />
                <asp:SessionParameter Name="pUsuario" SessionField="XSpUsuario" Type="String" />
                <asp:ControlParameter ControlID="cmbEstado" Name="Estado_ID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
