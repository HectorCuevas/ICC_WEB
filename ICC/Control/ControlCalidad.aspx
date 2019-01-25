<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="ControlCalidad.aspx.cs" Inherits="ICC.Control.ControlCalidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
    <div>
        <h2>Informe Medición</h2>
    </div>
    <dx:ASPxGridView ID="GridMaestro1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataMaestro" KeyFieldName="ModeloMolinete_ID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Cuenca_DSC" VisibleIndex="0" Caption="Cuenca">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sub-Cuenca / Rio" FieldName="SubCuencaRio_DSC" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Punto Monitoreo" FieldName="PuntoMonitoreo_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Modelo Molinete" FieldName="ModeloMolinete_DSC" ReadOnly="True" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipo Medición" FieldName="TipoMedicion_DSC" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipología" FieldName="Tipologia_DSC" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Duración" FieldName="Duracion" ReadOnly="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Fecha" FieldName="Fecha" ReadOnly="True" VisibleIndex="7">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Usuario" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Comentario" FieldName="Comentario" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTimeEditColumn FieldName="HoraInicial" VisibleIndex="8">
                <PropertiesTimeEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="HH:mm:ss">
                </PropertiesTimeEdit>
            </dx:GridViewDataTimeEditColumn>
            <dx:GridViewDataTimeEditColumn FieldName="HoraFinal" VisibleIndex="9">
                <PropertiesTimeEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="HH:mm:ss">
                </PropertiesTimeEdit>
            </dx:GridViewDataTimeEditColumn>
            <dx:GridViewDataTextColumn Caption="Caudal" FieldName="Caudal" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br /><br />
    <dx:ASPxGridView ID="GridDetalle" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataDetalle" KeyFieldName="Codigo" Width="100%">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Codigo" ReadOnly="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NoCorrelativo" ReadOnly="True" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MedicionBaseInicial" VisibleIndex="3" Caption="Base Inicial">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MedicionBaseFinal" VisibleIndex="4" Caption="Base Final">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SectorMetros" VisibleIndex="5" Caption="Sector">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="6" Caption="Área">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Revoluciones" VisibleIndex="7" Caption="Revoluciones">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Velocidad" VisibleIndex="8" Caption="Velocidad">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Caudal" VisibleIndex="9" Caption="Caudal">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br /><br />
    <dx:ASPxGridView ID="GridImagenes" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataMaestro" KeyFieldName="ModeloMolinete_ID">
        <Columns>
            <dx:GridViewDataBinaryImageColumn Caption="Fotografía" FieldName="FotografiaNorte" VisibleIndex="0">
                <PropertiesBinaryImage>
                    <EditingSettings Enabled="True">
                    </EditingSettings>
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
        </Columns>
    </dx:ASPxGridView>
    <br /><br />
    <br /><br />
    <dx:ASPxGridView ID="GridEstado" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataEstados" KeyFieldName="Estado_ID" OnCustomButtonCallback="GridEstado_CustomButtonCallback">
        <ClientSideEvents EndCallback="function(s, e) {
if(s.cpMuestra != null){
		window.location.href = s.cpMuestra; 
	}	
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Estado_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Estado" FieldName="Estado_DSC" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" VisibleIndex="0">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnCambiar" Text="Cambiar">
                        <Image IconID="actions_apply_16x16office2013">
                        </Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
        </Columns>
</dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataMaestro" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSpInformeMedicion" DeleteCommand="DELETE FROM [TRX_DYR_Movil] WHERE [Codigo] = @Codigo" InsertCommand="INSERT INTO [TRX_DYR_Movil] ([Codigo], [Cuenca_ID], [SubCuencaRio_ID], [PuntoMonitoreo_ID], [ModeloMolinete_ID], [TipoMedicion_ID], [Tipologia_ID]) VALUES (@Codigo, @Cuenca_ID, @SubCuencaRio_ID, @PuntoMonitoreo_ID, @ModeloMolinete_ID, @TipoMedicion_ID, @Tipologia_ID)" UpdateCommand="UPDATE [TRX_DYR_Movil] SET [Cuenca_ID] = @Cuenca_ID, [SubCuencaRio_ID] = @SubCuencaRio_ID, [PuntoMonitoreo_ID] = @PuntoMonitoreo_ID, [ModeloMolinete_ID] = @ModeloMolinete_ID, [TipoMedicion_ID] = @TipoMedicion_ID, [Tipologia_ID] = @Tipologia_ID WHERE [Codigo] = @Codigo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Codigo" SessionField="xCodigo" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Codigo" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Codigo" Type="Object" />
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
            <asp:Parameter Name="SubCuencaRio_ID" Type="Int32" />
            <asp:Parameter Name="PuntoMonitoreo_ID" Type="Int32" />
            <asp:Parameter Name="ModeloMolinete_ID" Type="Int32" />
            <asp:Parameter Name="TipoMedicion_ID" Type="Int32" />
            <asp:Parameter Name="Tipologia_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
            <asp:Parameter Name="SubCuencaRio_ID" Type="Int32" />
            <asp:Parameter Name="PuntoMonitoreo_ID" Type="Int32" />
            <asp:Parameter Name="ModeloMolinete_ID" Type="Int32" />
            <asp:Parameter Name="TipoMedicion_ID" Type="Int32" />
            <asp:Parameter Name="Tipologia_ID" Type="Int32" />
            <asp:Parameter Name="Codigo" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [TRX_DYR_Movil_Detalle] WHERE ([Codigo] = @Codigo)">
        <SelectParameters>
            <asp:SessionParameter Name="Codigo" SessionField="xCodigo" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataEstados" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT -1 AS Estado_ID, 'Cancelar' AS Estado_DSC UNION ALL 
SELECT * FROM CAT_STD_Estado ">
</asp:SqlDataSource>
</asp:Content>
