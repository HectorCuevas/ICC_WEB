<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Aprobar.aspx.cs" Inherits="ICC.Control.Aprobar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>&nbsp;Gestión de solicitudes</h2>
    </div>
    <hr />
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2"> 
        <Items>
            <dx:LayoutItem Caption="Organizacion">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="ASPxFormLayout1_E2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceOrganizacion" OnSelectedIndexChanged="ASPxFormLayout1_E2_SelectedIndexChanged" TextField="Organizacion_DSC" ValueField="Organizacion_ID">
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Plantilla">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="ASPxFormLayout1_E4" runat="server" AutoPostBack="True" DataSourceID="SqlDataPlantilla" OnSelectedIndexChanged="ASPxFormLayout1_E4_SelectedIndexChanged" TextField="DYR_DSC" ValueField="DYR_ID" ClientInstanceName="ASPxFormLayout1_E4">     
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%" ClientInstanceName="ASPxPageControl1">
        <TabPages>
            <dx:TabPage Text="Solicitud">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="GridViewSolicitud" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSolicitudes" KeyFieldName="Solicitud_ID" Width="100%">
                            <SettingsPager Mode="ShowAllRecords" PageSize="0">
                            </SettingsPager>
                            <SettingsSearchPanel Visible="True" />
                            <Columns>
                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Solicitud_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Organizacion_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nombre Apellido" FieldName="NombresApellidos" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Correo Electrónico" FieldName="CorreoElectronico" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Contrasena" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Estado_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Cuenca">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="GridViewCuenca" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataCuenca" KeyFieldName="SubCuencaRio_ID">
                            <SettingsPager Mode="ShowAllRecords" PageSize="0">
                            </SettingsPager>
                            <SettingsSearchPanel Visible="True" />
                            <Columns>
                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Cuenca_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Cuenca" FieldName="Cuenca_DSC" ShowInCustomizationForm="True" VisibleIndex="2" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SubCuencaRio_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sub Cuenca Rio" FieldName="SubCuencaRio_DSC" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Secciones">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="GridViewSecciones" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSecciones" KeyFieldName="SubSeccion_ID">
                            <SettingsPager Mode="ShowAllRecords" PageSize="0">
                            </SettingsPager>
                            <SettingsSearchPanel Visible="True" />
                            <Columns>
                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Seccion_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sección" FieldName="Seccion_DSC" ShowInCustomizationForm="True" VisibleIndex="2" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SubSeccion_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sub Sección" FieldName="SubSeccion_DSC" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    <dx:ASPxButton ID="btnAprobar" runat="server" OnClick="btnAprobar_Click" Text="Aprobar Solicitud">
    </dx:ASPxButton>
    <asp:SqlDataSource ID="SqlDataSourceOrganizacion" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpOrganizacion" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSolicitudes" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [TRX_Solicitud] WHERE (([Estado_ID] = @Estado_ID) AND ([Organizacion_ID] = @Organizacion_ID))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Estado_ID" Type="Int32" />
            <asp:SessionParameter Name="Organizacion_ID" SessionField="xOrganizacionID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataPlantilla" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [TRX_DYR_Plantilla_Encabezado] WHERE ([Organizacion_ID] = @Organizacion_ID) ORDER BY [DYR_DSC]">
        <SelectParameters>
            <asp:SessionParameter Name="Organizacion_ID" SessionField="xOrganizacionID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpCuencas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSecciones" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpSecciones" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
