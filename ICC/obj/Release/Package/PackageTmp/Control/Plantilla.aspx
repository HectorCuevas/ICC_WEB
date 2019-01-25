<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Plantilla.aspx.cs" Inherits="ICC.Control.Plantilla" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Plantilla</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridViewPlantillaEncabezado" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePlantillaEnc" KeyFieldName="DYR_ID" OnDetailRowExpandedChanged="ASPxGridViewPlantillaEncabezado_DetailRowExpandedChanged" Width="100%">
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxButton ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar">
                    <Image IconID="appearance_savetheme_16x16">
                    </Image>
                </dx:ASPxButton>
                <dx:ASPxPageControl ID="ASPxPageControlPlantilla" runat="server" ActiveTabIndex="0" Width="100%">
                    <TabPages>
                        <dx:TabPage Name="TabCuenca" Text="Cuenca">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxGridView ID="ASPxGridViewCuenca" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCuenca" KeyFieldName="SubCuencaRio_ID" Width="100%" ClientInstanceName="ASPxGridViewCuenca">
                                        <SettingsPager Mode="ShowAllRecords" PageSize="0">
                                        </SettingsPager>
                                        <SettingsCommandButton RenderMode="Image">
                                        </SettingsCommandButton>
                                        <SettingsSearchPanel Visible="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Cuenca_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Cuenca" FieldName="Cuenca_DSC" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SubCuencaRio_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sub-Cuenca/Rio" FieldName="SubCuencaRio_DSC" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Name="TabSeccion" Text="Seccion">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxGridView ID="ASPxGridViewSeccion" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSeccion" KeyFieldName="SubSeccion_ID" Width="100%">
                                        <SettingsPager Mode="ShowAllRecords" PageSize="0">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Seccion_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sección" FieldName="Seccion_DSC" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SubSeccion_ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sub-Sección" FieldName="SubSeccion_DSC" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </DetailRow>
        </Templates>
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="DYR_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Plantilla" FieldName="DYR_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Organizacion" FieldName="Organizacion_ID" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="SqlDataSourceOrganizacion" TextField="Organizacion_DSC" ValueField="Organizacion_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourcePlantillaEnc" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [TRX_DYR_Plantilla_Encabezado] WHERE [DYR_ID] = @DYR_ID" InsertCommand="INSERT INTO [TRX_DYR_Plantilla_Encabezado] ([DYR_DSC], [Organizacion_ID]) VALUES (@DYR_DSC, @Organizacion_ID)" SelectCommand="SELECT * FROM [TRX_DYR_Plantilla_Encabezado]" UpdateCommand="UPDATE [TRX_DYR_Plantilla_Encabezado] SET [DYR_DSC] = @DYR_DSC, [Organizacion_ID] = @Organizacion_ID WHERE [DYR_ID] = @DYR_ID">
        <DeleteParameters>
            <asp:Parameter Name="DYR_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DYR_DSC" Type="String" />
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DYR_DSC" Type="String" />
            <asp:Parameter Name="Organizacion_ID" Type="Int32" />
            <asp:Parameter Name="DYR_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOrganizacion" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Organizacion] ORDER BY [Organizacion_DSC]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpCuencas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSeccion" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpSecciones" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
