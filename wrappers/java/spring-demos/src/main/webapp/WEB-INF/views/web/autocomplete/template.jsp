<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<demo:header />
        <c:url value="/web/autocomplete/template/read" var="readUrl" />

        <%
        String headerTemplate = "<div class=\"dropdown-header\">" +
                "<span class=\"k-widget k-header\">Photo</span>" +
                "<span class=\"k-widget k-header\">Contact info</span>" +
            "</div>";

        String template = "<span class=\"k-state-default\"><img src=\"../../resources/web/Customers/#:data.customerId#.jpg\" alt=\"#:data.customerId#\" /></span>" +
                          "<span class=\"k-state-default\"><h3>#: data.ContactName #</h3><p>#: data.CompanyName #</p></span>";
        %>

        <div class="demo-section">
            <h2>Customers</h2>
            <kendo:autoComplete name="customers" dataTextField="contactName" placeholder="type 'John' ..."
                headerTemplate="<%=headerTemplate%>" template="<%=template%>" height="370"
                minLength="1" style="width:400px">
                <kendo:dataSource serverFiltering="true">
                    <kendo:dataSource-transport>
                       <kendo:dataSource-transport-read url="${readUrl}" type="POST" contentType="application/json"/>
                       <kendo:dataSource-transport-parameterMap>
                            <script>
                                function parameterMap(options) {
                                    return JSON.stringify(options);
                                }
                            </script>
                        </kendo:dataSource-transport-parameterMap>
                    </kendo:dataSource-transport>
                    <kendo:dataSource-schema data="data" total="total">
                    </kendo:dataSource-schema>
                </kendo:dataSource>
            </kendo:autoComplete>
            <p>
                Start typing to find a customer.
            </p>
        </div>

        <style>
            .dropdown-header {
                font-size: 1.2em;
            }

            .dropdown-header > span {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-align: left;
                display: inline-block;
                border-style: solid;
                border-width: 0 0 1px 1px;
                padding: .3em .6em;
                width: 312px;
            }

            .dropdown-header > span:first-child {
                width: 82px;
                border-left-width: 0;
            }

            .demo-section {
                width: 400px;
                margin: 35px auto 50px;
                padding: 30px;
            }
            .demo-section h2 {
                text-transform: uppercase;
                font-size: 1.2em;
                margin-bottom: 10px;
            }

            #customers-list {
                padding-bottom: 26px;
            }

            #customers-list .k-item > span{
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                display: inline-block;
                border-style: solid;
                border-width: 0 0 1px 1px;
                vertical-align: top;
                min-height: 95px;
                width: 79%;
                padding: .6em 0 0 .6em;
            }

            #customers-list .k-item > span:first-child{
                width: 77px;
                border-left-width: 0;
                padding: .6em 0 0 0;
            }

            #customers-list img {
                -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
                -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
                box-shadow: 0 0 2px rgba(0,0,0,.4);
                width: 70px;
                height: 70px;
            }

            #customers-list h3 {
                font-size: 1.6em;
                margin: 0;
                padding: 0;
            }

            #customers-list p {
                margin: 0;
                padding: 0;
            }
        </style>

<demo:footer />
