<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="Mapas.aspx.cs" Inherits="ICC.Reporte.Mapas" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyButkuD66P4-oJ0K90ER3gleqr_OEGBnmo&sensor=false&language=es">
    </script>
    <div class="accountHeader">
        <h2>Reporte Mapas Semáforo </h2>
    </div>
    <hr />
    <div id="myMap" style="position: relative; width: 100%; height: 600px;" />
    <script src="../Content/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var mapOptions = {
                center: new google.maps.LatLng(15, -90.54),
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("myMap"), mapOptions);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/Kml/achiguate.kmz');
            kmz_Layer.setMap(map);            
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/acomé.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/coyolate.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Los_Esclavos.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/madre_vieja.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/María_Linda.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/nahualate.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Naranjo_2.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Ococito.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Paso_Ondo.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Ríos_VERTIENTE_PACIFICO.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Samalá.kmz');
            kmz_Layer.setMap(map);
            var kmz_Layer = new google.maps.KmlLayer('http://40.71.198.9/ICC/Kml/Sis_Icán.kmz');
            kmz_Layer.setMap(map);
        });
    </script>
</asp:Content>
