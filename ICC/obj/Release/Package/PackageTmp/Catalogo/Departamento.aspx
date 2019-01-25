<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Departamento.aspx.cs" Inherits="ICC.Catalogo.Departamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
        <h2>Catalogo Departamento</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Departamento_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Departamento_ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Departamento_DSC" VisibleIndex="2" Caption="Departamento">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Departamento] WHERE [Departamento_ID] = @Departamento_ID" InsertCommand="INSERT INTO [CAT_STD_Departamento] ([Departamento_DSC]) VALUES (@Departamento_DSC)" SelectCommand="SELECT * FROM [CAT_STD_Departamento]" UpdateCommand="UPDATE [CAT_STD_Departamento] SET [Departamento_DSC] = @Departamento_DSC WHERE [Departamento_ID] = @Departamento_ID">
        <DeleteParameters>
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Departamento_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Departamento_DSC" Type="String" />
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

