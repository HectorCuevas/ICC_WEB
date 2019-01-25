<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="PuntoMonitoreo.aspx.cs" Inherits="ICC.Catalogo.PuntoMonitoreo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Punto Monitoreo</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="PuntoMonitoreo_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PuntoMonitoreo_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Punto Monitoreo" FieldName="PuntoMonitoreo_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Desembocadura" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="Rojo" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Amarillo" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Verde" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Valor KPI" FieldName="Valor_KPI_Actual" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Archivo KMZ" FieldName="Nombre_Archivo_KMZ" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GpsLatitud" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GpsLongitud" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Sub Cuenca/Rio" FieldName="SubCuenca_Rio_ID" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="SqlDataSourceSubCuenca" TextField="SubCuencaRio_DSC" ValueField="SubCuencaRio_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_PuntoMonitoreo] WHERE [PuntoMonitoreo_ID] = @PuntoMonitoreo_ID" InsertCommand="INSERT INTO [CAT_STD_PuntoMonitoreo] ([PuntoMonitoreo_DSC], [SubCuenca_Rio_ID], [Desembocadura], [Rojo], [Amarillo], [Verde], [Valor_KPI_Actual], [Nombre_Archivo_KMZ], [GpsLatitud], [GpsLongitud]) VALUES (@PuntoMonitoreo_DSC, @SubCuenca_Rio_ID, @Desembocadura, @Rojo, @Amarillo, @Verde, @Valor_KPI_Actual, @Nombre_Archivo_KMZ, @GpsLatitud, @GpsLongitud)" SelectCommand="SELECT * FROM [CAT_STD_PuntoMonitoreo]" UpdateCommand="UPDATE [CAT_STD_PuntoMonitoreo] SET [PuntoMonitoreo_DSC] = @PuntoMonitoreo_DSC, [SubCuenca_Rio_ID] = @SubCuenca_Rio_ID, [Desembocadura] = @Desembocadura, [Rojo] = @Rojo, [Amarillo] = @Amarillo, [Verde] = @Verde, [Valor_KPI_Actual] = @Valor_KPI_Actual, [Nombre_Archivo_KMZ] = @Nombre_Archivo_KMZ, [GpsLatitud] = @GpsLatitud, [GpsLongitud] = @GpsLongitud WHERE [PuntoMonitoreo_ID] = @PuntoMonitoreo_ID">
        <DeleteParameters>
            <asp:Parameter Name="PuntoMonitoreo_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PuntoMonitoreo_DSC" Type="String" />
            <asp:Parameter Name="SubCuenca_Rio_ID" Type="Int32" />
            <asp:Parameter Name="Desembocadura" Type="Boolean" />
            <asp:Parameter Name="Rojo" Type="Decimal" />
            <asp:Parameter Name="Amarillo" Type="Decimal" />
            <asp:Parameter Name="Verde" Type="Decimal" />
            <asp:Parameter Name="Valor_KPI_Actual" Type="Decimal" />
            <asp:Parameter Name="Nombre_Archivo_KMZ" Type="String" />
            <asp:Parameter Name="GpsLatitud" Type="Decimal" />
            <asp:Parameter Name="GpsLongitud" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PuntoMonitoreo_DSC" Type="String" />
            <asp:Parameter Name="SubCuenca_Rio_ID" Type="Int32" />
            <asp:Parameter Name="Desembocadura" Type="Boolean" />
            <asp:Parameter Name="Rojo" Type="Decimal" />
            <asp:Parameter Name="Amarillo" Type="Decimal" />
            <asp:Parameter Name="Verde" Type="Decimal" />
            <asp:Parameter Name="Valor_KPI_Actual" Type="Decimal" />
            <asp:Parameter Name="Nombre_Archivo_KMZ" Type="String" />
            <asp:Parameter Name="GpsLatitud" Type="Decimal" />
            <asp:Parameter Name="GpsLongitud" Type="Decimal" />
            <asp:Parameter Name="PuntoMonitoreo_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSubCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT [SubCuencaRio_ID], [SubCuencaRio_DSC] FROM [CAT_STD_SubCuencaRio] ORDER BY [SubCuencaRio_DSC]"></asp:SqlDataSource>
</asp:Content>
