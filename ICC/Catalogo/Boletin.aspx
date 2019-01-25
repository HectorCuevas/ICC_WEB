<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Boletin.aspx.cs" Inherits="ICC.Catalogo.Boletin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
    <div>
        <h2>Catalogo Boletín</h2>
    </div>
    <hr /><dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceBoletin" KeyFieldName="CodigoBoletin" OnDetailRowExpandedChanged="ASPxGridView1_DetailRowExpandedChanged" Width="100%" OnRowInserting="ASPxGridView1_RowInserting">
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxFileManager ID="ASPxFileManager1" runat="server" OnFileUploading="ASPxFileManager1_FileUploading" OnInit="ASPxFileManager1_Init">
                    <Settings RootFolder="~/Boletines" ThumbnailFolder="~/Thumb" />
                    <SettingsFolders Visible="False" />
                </dx:ASPxFileManager>
            </DetailRow>
        </Templates>
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <Settings ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="CodigoBoletin" ReadOnly="True" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NombreDocumento" VisibleIndex="3" Caption="Nombre Boletín">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaPublicacion" VisibleIndex="4" Caption="Fecha Publicación">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="5" Caption="Descripción Boletín">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tipo Boletín" FieldName="CodigoTipoBoletin" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="SqlDataSourceTipoBoletin" TextField="Tipo_Boletin_DSC" ValueField="Tipo_Boletin_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="NombreArchivo" Name="NombreArchivo" Visible="False" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourceBoletin" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Boletin] WHERE [CodigoBoletin] = @CodigoBoletin" InsertCommand="INSERT INTO [CAT_STD_Boletin] ([CodigoTipoBoletin], [NombreDocumento], [FechaPublicacion], [Descripcion], [NombreArchivo]) VALUES (@CodigoTipoBoletin, @NombreDocumento, @FechaPublicacion, @Descripcion, @NombreArchivo)" SelectCommand="SELECT * FROM [CAT_STD_Boletin]" UpdateCommand="UPDATE [CAT_STD_Boletin] SET [CodigoTipoBoletin] = @CodigoTipoBoletin, [NombreDocumento] = @NombreDocumento, [FechaPublicacion] = @FechaPublicacion, [Descripcion] = @Descripcion, [NombreArchivo] = @NombreArchivo WHERE [CodigoBoletin] = @CodigoBoletin">
        <DeleteParameters>
            <asp:Parameter Name="CodigoBoletin" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodigoTipoBoletin" Type="Int32" />
            <asp:Parameter Name="NombreDocumento" Type="String" />
            <asp:Parameter Name="FechaPublicacion" Type="DateTime" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="NombreArchivo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CodigoTipoBoletin" Type="Int32" />
            <asp:Parameter Name="NombreDocumento" Type="String" />
            <asp:Parameter Name="FechaPublicacion" Type="DateTime" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="NombreArchivo" Type="String" />
            <asp:Parameter Name="CodigoBoletin" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTipoBoletin" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_TipoBoletin] ORDER BY [Tipo_Boletin_DSC]"></asp:SqlDataSource>
</asp:Content>
