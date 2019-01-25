<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="InformeMonitoreo.aspx.cs" Inherits="ICC.Catalogo.InformeMonitoreo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
        <h2>Informe Monitoreo</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataBoletin" KeyFieldName="CodigoBoletin" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback">
            <ClientSideEvents EndCallback="function(s, e) {
	if(s.cpBoletin != null){
		var lBoletin = '../Boletines/' + s.cpBoletin;
		window.open(lBoletin,'_blank');
}
}" />
            <SettingsPager Mode="ShowAllRecords" PageSize="0">
            </SettingsPager>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CodigoBoletin" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreDocumento" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaPublicacion" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreArchivo" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" VisibleIndex="0">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnMostrar" Text="Mostrar">
                            <Image AlternateText="Mostrar" IconID="find_find_16x16gray" ToolTip="Mostrar">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
            </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataBoletin" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT CodigoBoletin,NombreDocumento,FechaPublicacion,Descripcion,NombreArchivo FROM CAT_STD_Boletin WHERE CodigoTipoBoletin = 2 ORDER BY NombreDocumento"></asp:SqlDataSource>
</asp:Content>
