<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="ICC.Cuenta.Solicitud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:500px; margin:0 auto; text-align: center; border-radius: 25px; border: 2px solid #73AD21; ">
        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Content/ICC.png" ShowLoadingImage="True" style="text-align: center">
        </dx:ASPxImage>      
        <p><b>Bienvenidos al Sistema de Información Meteorológica del ICC</b></p>
        <p>Solicitud de registro base de datos ICC.</p>
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem ColSpan="2" Caption="Nombre Completo">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="100%">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Correo Electronico" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Organizacion" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" DataSourceID="SqlDataSource" SelectedIndex="0" TextField="Organizacion_DSC" ValueField="Organizacion_ID" Width="100%">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Organizacion] ORDER BY [Organizacion_DSC]"></asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Departamento" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ASPxFormLayout1_E1" ClientInstanceName="ASPxFormLayout1_E1" runat="server" DataSourceID="SqlDataSourceDepto" Width="100%" SelectedIndex="0" TextField="Departamento_DSC" ValueField="Departamento_ID">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ASPxFormLayout1_E5.PerformCallback(ASPxFormLayout1_E1.GetValue().toString());
}" />
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataSourceDepto" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Departamento] ORDER BY [Departamento_DSC]"></asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Municipio" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ASPxFormLayout1_E5" ClientInstanceName="ASPxFormLayout1_E5" runat="server" DataSourceID="SqlDataSourceMunicipio" OnCallback="ASPxFormLayout1_E5_Callback" TextField="Municipio_DSC" ValueField="Municipio_ID" Width="100%" SelectedIndex="0">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Municipio] WHERE ([Departamento_ID] = @Departamento_ID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ASPxFormLayout1_E1" Name="Departamento_ID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="2" Caption="Contraseña">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%" Password="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="2" Caption="Re Contraseña">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="100%" Password="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                            <dx:ASPxButton ID="ASPxFormLayout1_E8" runat="server" Text="Aceptar" Width="100%" OnClick="ASPxFormLayout1_E8_Click">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                            <dx:ASPxButton ID="ASPxFormLayout1_E10" runat="server" Text="Cancelar" Width="100%" OnClick="ASPxFormLayout1_E10_Click">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
    </div>
    </form>
</body>
</html>
