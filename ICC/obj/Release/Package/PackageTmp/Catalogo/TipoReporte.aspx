<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="TipoReporte.aspx.cs" Inherits="ICC.Catalogo.TipoReporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Tipo Reporte</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="TipoReporte_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TipoReporte_ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TipoReporte_DSC" VisibleIndex="2" Caption="Tipo Reporte">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_TipoReporte] WHERE [TipoReporte_ID] = @TipoReporte_ID" InsertCommand="INSERT INTO [CAT_STD_TipoReporte] ([TipoReporte_DSC]) VALUES (@TipoReporte_DSC)" SelectCommand="SELECT * FROM [CAT_STD_TipoReporte]" UpdateCommand="UPDATE [CAT_STD_TipoReporte] SET [TipoReporte_DSC] = @TipoReporte_DSC WHERE [TipoReporte_ID] = @TipoReporte_ID">
        <DeleteParameters>
            <asp:Parameter Name="TipoReporte_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TipoReporte_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TipoReporte_DSC" Type="String" />
            <asp:Parameter Name="TipoReporte_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
