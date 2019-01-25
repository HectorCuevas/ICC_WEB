<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Municipio.aspx.cs" Inherits="ICC.Catalogo.Municipio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Tipo Municipio</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="Municipio_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Municipio_ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Municipio_DSC" VisibleIndex="3" Caption="Municipio">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Departamento" FieldName="Departamento_ID" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="SqlDataSourceDepartamento" TextField="Departamento_DSC" ValueField="Departamento_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_Municipio] WHERE [Municipio_ID] = @Municipio_ID" InsertCommand="INSERT INTO [CAT_STD_Municipio] ([Departamento_ID], [Municipio_DSC]) VALUES (@Departamento_ID, @Municipio_DSC)" SelectCommand="SELECT * FROM [CAT_STD_Municipio]" UpdateCommand="UPDATE [CAT_STD_Municipio] SET [Departamento_ID] = @Departamento_ID, [Municipio_DSC] = @Municipio_DSC WHERE [Municipio_ID] = @Municipio_ID">
        <DeleteParameters>
            <asp:Parameter Name="Municipio_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
            <asp:Parameter Name="Municipio_DSC" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
            <asp:Parameter Name="Municipio_DSC" Type="String" />
            <asp:Parameter Name="Municipio_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDepartamento" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Departamento] ORDER BY [Departamento_DSC]"></asp:SqlDataSource>
</asp:Content>
