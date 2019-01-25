<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="BoletinMetereologico.aspx.cs" Inherits="ICC.Catalogo.BoletinMetereologico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
        <h1>Boletín Meteorológico</h1>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataBoletin" KeyFieldName="CodigoBoletin">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
         <Columns>
            <dx:GridViewDataTextColumn FieldName="CodigoBoletin" Caption="Código Boletín" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaPublicacion" Caption="Fecha Publicación" VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="4" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NombreArchivo" VisibleIndex="5" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="NombreArchivo" Caption="Nombre Documento" VisibleIndex="2">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="../Boletines/{0}" TextField="NombreDocumento" Target="_blank" >
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataBoletin" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="xSPBoletines" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="8" Name="CodigoOpcion" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
