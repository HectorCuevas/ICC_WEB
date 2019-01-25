<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Organizacion.aspx.cs" Inherits="ICC.Catalogo.Organizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Organización</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Organizacion_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Organizacion_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Organizacion" FieldName="Organizacion_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cultivo" FieldName="Cultivo_DSC" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Organizacion] WHERE [Organizacion_ID] = @Organizacion_ID" InsertCommand="INSERT INTO [CAT_STD_Organizacion] ([Organizacion_DSC], [Cultivo_DSC]) VALUES (@Organizacion_DSC, @Cultivo_DSC)" SelectCommand="SELECT * FROM [CAT_STD_Organizacion]" UpdateCommand="UPDATE [CAT_STD_Organizacion] SET [Organizacion_DSC] = @Organizacion_DSC, [Cultivo_DSC] = @Cultivo_DSC WHERE [Organizacion_ID] = @Organizacion_ID">
        <DeleteParameters>
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Organizacion_DSC" Type="String" />
            <asp:Parameter Name="Cultivo_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Organizacion_DSC" Type="String" />
            <asp:Parameter Name="Cultivo_DSC" Type="String" />
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
