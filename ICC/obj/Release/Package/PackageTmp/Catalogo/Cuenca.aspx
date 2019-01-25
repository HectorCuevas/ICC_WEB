<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Cuenca.aspx.cs" Inherits="ICC.Catalogo.Cuenca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Cuenca</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Cuenca_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Cuenca_ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cuenca_DSC" VisibleIndex="2" Caption="Cuenca">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Cuenca] WHERE [Cuenca_ID] = @Cuenca_ID" InsertCommand="INSERT INTO [CAT_STD_Cuenca] ([Cuenca_DSC]) VALUES (@Cuenca_DSC)" SelectCommand="SELECT * FROM [CAT_STD_Cuenca]" UpdateCommand="UPDATE [CAT_STD_Cuenca] SET [Cuenca_DSC] = @Cuenca_DSC WHERE [Cuenca_ID] = @Cuenca_ID">
        <DeleteParameters>
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Cuenca_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cuenca_DSC" Type="String" />
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
