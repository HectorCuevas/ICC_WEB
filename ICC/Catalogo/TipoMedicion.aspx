<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="TipoMedicion.aspx.cs" Inherits="ICC.Catalogo.TipoMedicion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Tipo Medición</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="TipoMedicion_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TipoMedicion_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipo Medicion" FieldName="TipoMedicion_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_TipoMedicion] WHERE [TipoMedicion_ID] = @TipoMedicion_ID" InsertCommand="INSERT INTO [CAT_STD_TipoMedicion] ([TipoMedicion_DSC]) VALUES (@TipoMedicion_DSC)" SelectCommand="SELECT * FROM [CAT_STD_TipoMedicion]" UpdateCommand="UPDATE [CAT_STD_TipoMedicion] SET [TipoMedicion_DSC] = @TipoMedicion_DSC WHERE [TipoMedicion_ID] = @TipoMedicion_ID">
        <DeleteParameters>
            <asp:Parameter Name="TipoMedicion_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TipoMedicion_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TipoMedicion_DSC" Type="String" />
            <asp:Parameter Name="TipoMedicion_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
