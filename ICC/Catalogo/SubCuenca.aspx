<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="SubCuenca.aspx.cs" Inherits="ICC.Catalogo.SubCuenca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Catalogo Sub-Cuenca</h2>
    </div>
    <hr />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="SubCuencaRio_ID">
        <SettingsPager Mode="ShowAllRecords" PageSize="0">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SubCuencaRio_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SubCuenca" FieldName="SubCuencaRio_DSC" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Cuenca" FieldName="Cuenca_ID" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="SqlDataSourceCuenca" TextField="Cuenca_DSC" ValueField="Cuenca_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" DeleteCommand="DELETE FROM [CAT_STD_SubCuencaRio] WHERE [SubCuencaRio_ID] = @SubCuencaRio_ID" InsertCommand="INSERT INTO [CAT_STD_SubCuencaRio] ([SubCuencaRio_DSC], [Cuenca_ID]) VALUES (@SubCuencaRio_DSC, @Cuenca_ID)" SelectCommand="SELECT * FROM [CAT_STD_SubCuencaRio]" UpdateCommand="UPDATE [CAT_STD_SubCuencaRio] SET [SubCuencaRio_DSC] = @SubCuencaRio_DSC, [Cuenca_ID] = @Cuenca_ID WHERE [SubCuencaRio_ID] = @SubCuencaRio_ID">
        <DeleteParameters>
            <asp:Parameter Name="SubCuencaRio_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SubCuencaRio_DSC" Type="String" />
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SubCuencaRio_DSC" Type="String" />
            <asp:Parameter Name="Cuenca_ID" Type="Int32" />
            <asp:Parameter Name="SubCuencaRio_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCuenca" runat="server" ConnectionString="<%$ ConnectionStrings:ICCConnectionString %>" SelectCommand="SELECT * FROM [CAT_STD_Cuenca] ORDER BY [Cuenca_DSC]"></asp:SqlDataSource>
</asp:Content>
