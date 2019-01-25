<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Tipologia.aspx.cs" Inherits="ICC.Catalogo.Tipologia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Tipología</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Tipologia_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Tipologia_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipologia" FieldName="Tipologia_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Tipologia] WHERE [Tipologia_ID] = @Tipologia_ID" InsertCommand="INSERT INTO [CAT_STD_Tipologia] ([Tipologia_DSC]) VALUES (@Tipologia_DSC)" SelectCommand="SELECT * FROM [CAT_STD_Tipologia]" UpdateCommand="UPDATE [CAT_STD_Tipologia] SET [Tipologia_DSC] = @Tipologia_DSC WHERE [Tipologia_ID] = @Tipologia_ID">
        <DeleteParameters>
            <asp:Parameter Name="Tipologia_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tipologia_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tipologia_DSC" Type="String" />
            <asp:Parameter Name="Tipologia_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
