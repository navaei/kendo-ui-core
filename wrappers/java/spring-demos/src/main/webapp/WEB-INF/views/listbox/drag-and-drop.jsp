<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<demo:header />

<div class="demo-section k-content wide">
    <kendo:listBox name="listbox1" dataTextField="ProductName" dataValueField="ProductID"
      connectWith="#listbox2" add="onAdd" remove="onRemove" draggable="true" dropSources="${list1Source}">   
      <kendo:listBox-toolbar position="left" tools="${sourceTools}"></kendo:listBox-toolbar>   
      <kendo:dataSource data="${data}">
      </kendo:dataSource> 
    </kendo:listBox>
    <kendo:listBox name="listbox2" dataTextField="ProductName" dataValueField="ProductID" 
    	connectWith="#listbox1" draggable="true" dropSources="${list2Source}">
    	<kendo:listBox-toolbar position="left" tools="${destinationTools}"></kendo:listBox-toolbar>   
    	<kendo:dataSource data="${data}"></kendo:dataSource>   	 
    </kendo:listBox>
</div>
<script>
    var dataSource;
	
    $(document).ready(function () {
        var crudServiceBaseUrl = "https://demos.telerik.com/kendo-ui/service";
        
        $("#button").kendoButton({
            click: function (e) {
                dataSource.sync();
            }
        });
                
        dataSource = new kendo.data.DataSource({
            serverFiltering: false,
            transport: {
                read: {
                    url: crudServiceBaseUrl + "/Products",
                    dataType: "jsonp"
                },
                update: {
                    url: crudServiceBaseUrl + "/Products/Update",
                    dataType: "jsonp"
                },
                parameterMap: function (options, operation) {
                    if (operation !== "read" && options.models) {
                        return { models: kendo.stringify(options.models) };
                    }
                }
            },
            batch: true,
            schema: {
                model: {
                    id: "ProductID",
                    fields: {
                        ProductID: { editable: false, nullable: true },
                        ProductName: { validation: { required: true } },
                        UnitPrice: { type: "number", validation: { required: true, min: 1 } },
                        Discontinued: { type: "boolean" },
                        UnitsInStock: { type: "number", validation: { min: 0, required: true } }
                    }
                }
            }
        });

        dataSource.fetch(function () {
            var data = this.data();
            var listbox1 = $("#listbox1").data("kendoListBox");
            var listbox2 = $("#listbox2").data("kendoListBox");
            for (var i = 0; i < data.length; i++) {
                if (data[i]["Discontinued"]) {
                    listbox1.add(data[i]);
                }
                else {
                    listbox2.add(data[i]);
                }
            }
        });        
    });
    
	function onAdd(e) {
		setDiscontinued(e, true);
	}
	
	function onRemove(e) {
		setDiscontinued(e, false);
	}
	
    function setDiscontinued(ev, flag) {
        var removedItems = ev.dataItems;
        for (var i = 0; i < removedItems.length; i++) {
            var item = dataSource.getByUid(removedItems[i].uid);
            item["Discontinued"] = flag;
            item.dirty = !item.dirty;
        }
    }
</script>

<style>
    #button {
        float: right;
        margin-top: 20px;    
    }

    #example .demo-section {
        max-width: none;
        width: 555px;
    }

    #example .k-listbox {
        width: 255px;
        height: 310px;
    }

        #example .k-listbox:first-child {
            
        }

    #example .k-i-redo {
        margin-bottom: 10px;
        opacity: 0.5;
    }

    #example .k-i-redo:hover {
        color: inherit!important;
    }

    #example .flipped {
        -webkit-transform: rotate(180deg);
        -moz-transform: rotate(180deg);
        -o-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        transform: rotate(180deg);
        margin-top: 30px;
        margin-right: 1px;
    }
</style>

            
<demo:footer />