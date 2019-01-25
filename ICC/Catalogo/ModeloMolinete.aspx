<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="ModeloMolinete.aspx.cs" Inherits="ICC.Catalogo.ModeloMolinete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Modelo Molinete</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="ModeloMolinete_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ModeloMolinete_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Modelo Molinete" FieldName="ModeloMolinete_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_ModeloMolinete] WHERE [ModeloMolinete_ID] = @ModeloMolinete_ID" InsertCommand="INSERT INTO [CAT_STD_ModeloMolinete] ([ModeloMolinete_DSC]) VALUES (@ModeloMolinete_DSC)" SelectCommand="SELECT * FROM [CAT_STD_ModeloMolinete]" UpdateCommand="UPDATE [CAT_STD_ModeloMolinete] SET [ModeloMolinete_DSC] = @ModeloMolinete_DSC WHERE [ModeloMolinete_ID] = @ModeloMolinete_ID">
        <DeleteParameters>
            <asp:Parameter Name="ModeloMolinete_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ModeloMolinete_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ModeloMolinete_DSC" Type="String" />
            <asp:Parameter Name="ModeloMolinete_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
