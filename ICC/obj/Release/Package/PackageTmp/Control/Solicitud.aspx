<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="ICC.Control.Solicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1" DataSourceID="SqlDataSolicitud" KeyFieldName="Solicitud_ID" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnRowUpdated="ASPxGridView1_RowUpdated">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <Settings ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Solicitud_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Completo" FieldName="NombresApellidos" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Correo Electrónico" FieldName="CorreoElectronico" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Contraseña" FieldName="Contrasena" VisibleIndex="7" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Organización" FieldName="Organizacion_ID" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="SqlDataOrganizacion" TextField="Organizacion_DSC" ValueField="Organizacion_ID">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { SubOrganizacionCallback(s); }"></ClientSideEvents>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Departamento" FieldName="Departamento_ID" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="SqlDataDepartamento" TextField="Departamento_DSC" ValueField="Departamento_ID">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { SubDepartamentoCallback(s); }"></ClientSideEvents>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Municipio" FieldName="Municipio_ID" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="SqlDataMunicipio" TextField="Municipio_DSC" ValueField="Municipio_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Estado_ID" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="SqlDataEstado" TextField="Estado_DSC" ValueField="Estado_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Plantilla" FieldName="DYR_ID" VisibleIndex="9">
                <PropertiesComboBox DataSourceID="SqlDataPlantilla" TextField="DYR_DSC" ValueField="DYR_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSolicitud" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [TRX_Solicitud] WHERE [Solicitud_ID] = @Solicitud_ID" InsertCommand="INSERT INTO [TRX_Solicitud] ([Organizacion_ID], [Departamento_ID], [Municipio_ID], [NombresApellidos], [CorreoElectronico], [Contrasena], [Estado_ID], [DYR_ID]) VALUES (@Organizacion_ID, @Departamento_ID, @Municipio_ID, @NombresApellidos, @CorreoElectronico, @Contrasena, @Estado_ID, @DYR_ID)" SelectCommand="SELECT * FROM [TRX_Solicitud]" UpdateCommand="UPDATE [TRX_Solicitud] SET [Organizacion_ID] = @Organizacion_ID, [Departamento_ID] = @Departamento_ID, [Municipio_ID] = @Municipio_ID, [NombresApellidos] = @NombresApellidos, [CorreoElectronico] = @CorreoElectronico, [Contrasena] = @Contrasena, [Estado_ID] = @Estado_ID, [DYR_ID] = @DYR_ID WHERE [Solicitud_ID] = @Solicitud_ID">
        <DeleteParameters>
            <asp:Parameter Name="Solicitud_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
            <asp:Parameter Name="Municipio_ID" Type="Int32" />
            <asp:Parameter Name="NombresApellidos" Type="String" />
            <asp:Parameter Name="CorreoElectronico" Type="String" />
            <asp:Parameter Name="Contrasena" Type="String" />
            <asp:Parameter Name="Estado_ID" Type="Int32" />
            <asp:Parameter Name="DYR_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
            <asp:Parameter Name="Departamento_ID" Type="Int32" />
            <asp:Parameter Name="Municipio_ID" Type="Int32" />
            <asp:Parameter Name="NombresApellidos" Type="String" />
            <asp:Parameter Name="CorreoElectronico" Type="String" />
            <asp:Parameter Name="Contrasena" Type="String" />
            <asp:Parameter Name="Estado_ID" Type="Int32" />
            <asp:Parameter Name="DYR_ID" Type="Int32" />
            <asp:Parameter Name="Solicitud_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataOrganizacion" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Organizacion] ORDER BY [Organizacion_DSC]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataDepartamento" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Departamento] ORDER BY [Departamento_DSC]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataMunicipio" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Municipio] ORDER BY [Municipio_DSC]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataEstado" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Estado] ORDER BY [Estado_DSC]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataPlantilla" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [TRX_DYR_Plantilla_Encabezado] ORDER BY [DYR_DSC]"></asp:SqlDataSource>
    <script type="text/javascript">
        function SubOrganizacionCallback(s) {
            ASPxGridView1.GetEditor("DYR_ID").PerformCallback(s.GetValue().toString());
        }
        function SubDepartamentoCallback(s) {
            ASPxGridView1.GetEditor("Municipio_ID").PerformCallback(s.GetValue().toString());
        }
    </script>
</asp:Content>
