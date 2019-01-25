<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Seccion.aspx.cs" Inherits="ICC.Catalogo.Seccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Sección</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Seccion_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Seccion_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Seccion" FieldName="Seccion_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Objetivo" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Seccion] WHERE [Seccion_ID] = @Seccion_ID" InsertCommand="INSERT INTO [CAT_STD_Seccion] ([Seccion_DSC], [Objetivo]) VALUES (@Seccion_DSC, @Objetivo)" SelectCommand="SELECT * FROM [CAT_STD_Seccion]" UpdateCommand="UPDATE [CAT_STD_Seccion] SET [Seccion_DSC] = @Seccion_DSC, [Objetivo] = @Objetivo WHERE [Seccion_ID] = @Seccion_ID">
        <DeleteParameters>
            <asp:Parameter Name="Seccion_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Seccion_DSC" Type="String" />
            <asp:Parameter Name="Objetivo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Seccion_DSC" Type="String" />
            <asp:Parameter Name="Objetivo" Type="String" />
            <asp:Parameter Name="Seccion_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
