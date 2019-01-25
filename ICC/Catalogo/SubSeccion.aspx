<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="SubSeccion.aspx.cs" Inherits="ICC.Catalogo.SubSeccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Sub-Sección/Rio</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="SubSeccion_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SubSeccion_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SubSeccion" FieldName="SubSeccion_DSC" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Objetivo" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Seccion" FieldName="Seccion_ID" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="SqlDataSourceSeccion" TextField="Seccion_DSC" ValueField="Seccion_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_SubSeccion] WHERE [SubSeccion_ID] = @SubSeccion_ID" InsertCommand="INSERT INTO [CAT_STD_SubSeccion] ([SubSeccion_DSC], [Objetivo], [Seccion_ID]) VALUES (@SubSeccion_DSC, @Objetivo, @Seccion_ID)" SelectCommand="SELECT * FROM [CAT_STD_SubSeccion]" UpdateCommand="UPDATE [CAT_STD_SubSeccion] SET [SubSeccion_DSC] = @SubSeccion_DSC, [Objetivo] = @Objetivo, [Seccion_ID] = @Seccion_ID WHERE [SubSeccion_ID] = @SubSeccion_ID">
        <DeleteParameters>
            <asp:Parameter Name="SubSeccion_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SubSeccion_DSC" Type="String" />
            <asp:Parameter Name="Objetivo" Type="String" />
            <asp:Parameter Name="Seccion_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SubSeccion_DSC" Type="String" />
            <asp:Parameter Name="Objetivo" Type="String" />
            <asp:Parameter Name="Seccion_ID" Type="Int32" />
            <asp:Parameter Name="SubSeccion_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSeccion" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Seccion] ORDER BY [Seccion_DSC]"></asp:SqlDataSource>
</asp:Content>
