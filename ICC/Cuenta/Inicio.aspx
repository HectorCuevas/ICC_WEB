<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ICC.Cuenta.Inicio" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:500px; margin:0 auto; text-align: center; vertical-align: middle;">
        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Content/ICC.png" ShowLoadingImage="True" style="text-align: center">
        </dx:ASPxImage>
        <p><b>Bienvenidos al Sistema de Información Meteorológica del ICC</b></p>
        <p>Con el objetivo de crear una base de datos de los usuarios de la información meteorológica de la costa sur del país, lo invitamos a registrarse gratuitamente en nuestra página. Dicho registro le permitirá consultar la información meteorológica en tiempo real, así como consultar y descargar la base de datos histórica de nuestra red de estaciones meteorológicas automáticas.</p>      
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem ColSpan="2" Caption="Usuario">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="100%">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="2" Caption="Contraseña">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%" Password="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="2" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxHyperLink ID="ASPxFormLayout1_E6" runat="server" NavigateUrl="~/Cuenta/Solicitud.aspx" Text="Deseo registrarme">
                            </dx:ASPxHyperLink>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:EmptyLayoutItem ColSpan="2">
                </dx:EmptyLayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="ASPxFormLayout1_E8" runat="server" Text="Aceptar" Width="100%" OnClick="ASPxFormLayout1_E8_Click">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="ASPxFormLayout1_E10" runat="server" Text="Cancelar" Width="100%" OnClick="ASPxFormLayout1_E10_Click">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ColSpan="2" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="ASPxFormLayout1_E7" runat="server" OnClick="ASPxFormLayout1_E7_Click" Text="Recuperar Contraseña" Width="100%">
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
