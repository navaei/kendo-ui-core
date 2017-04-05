using System;
using Kendo.Mvc.Extensions;

namespace Kendo.Mvc.UI.Fluent
{
    /// <summary>
    /// Defines the fluent API for configuring the Kendo UI ListBox
    /// </summary>
    public partial class ListBoxBuilder<T>
        where T : class 
    {
        /// <summary>
        /// If set to false the widget will not bind to the data source during initialization. In this case data binding will occur when the change event of the data source is fired. By default the widget will bind to the data source specified in the configuration.
        /// </summary>
        /// <param name="value">The value for AutoBind</param>
        public ListBoxBuilder<T> AutoBind(bool value)
        {
            Container.AutoBind = value;
            return this;
        }

        /// <summary>
        /// Selector which determines the target ListBox container that should be used when items are transferd from and to the current ListBox widget. The connectWith option describes one way relationship, if the developer wants a two way connection then the connectWith option should be set on both widgets.
        /// </summary>
        /// <param name="value">The value for ConnectWith</param>
        public ListBoxBuilder<T> ConnectWith(string value)
        {
            Container.ConnectWith = value;
            return this;
        }

        /// <summary>
        /// The field of the data item that provides the text content of the list items. The widget will filter the data source based on this field.
        /// </summary>
        /// <param name="value">The value for DataTextField</param>
        public ListBoxBuilder<T> DataTextField(string value)
        {
            Container.DataTextField = value;
            return this;
        }

        /// <summary>
        /// The field of the data item that provides the value of the widget.
        /// </summary>
        /// <param name="value">The value for DataValueField</param>
        public ListBoxBuilder<T> DataValueField(string value)
        {
            Container.DataValueField = value;
            return this;
        }

        /// <summary>
        /// If set to true the widget will be disabled and will not allow user interaction. The widget is enabled by default and allows user interaction.
        /// </summary>
        /// <param name="value">The value for Disabled</param>
        public ListBoxBuilder<T> Disabled(bool value)
        {
            Container.Disabled = value;
            return this;
        }

        /// <summary>
        /// If set to true the widget will be disabled and will not allow user interaction. The widget is enabled by default and allows user interaction.
        /// </summary>
        public ListBoxBuilder<T> Disabled()
        {
            Container.Disabled = true;
            return this;
        }

        /// <summary>
        /// Provides a way for customization of the sortable item hint. If a function is supplied, it receives one argument - the draggable element's jQuery object.
		/// If hint function is not provided the widget will clone dragged item and use it as a hint.
        /// </summary>
        /// <param name="handler">The name of the JavaScript function that will be evaluated.</param>
        public ListBoxBuilder<T> Hint(string handler)
        {
            Container.Hint = new ClientHandlerDescriptor { HandlerName = handler };
            return this;
        }

        /// <summary>
        /// Provides a way for customization of the sortable item hint. If a function is supplied, it receives one argument - the draggable element's jQuery object.
		/// If hint function is not provided the widget will clone dragged item and use it as a hint.
        /// </summary>
        /// <param name="handler">The handler code wrapped in a text tag.</param>
        public ListBoxBuilder<T> Hint(Func<object, object> handler)
        {
            Container.Hint = new ClientHandlerDescriptor { TemplateDelegate = handler };
            return this;
        }
        /// <summary>
        /// Indicates if the widget items can be draged and droped.
        /// </summary>
        /// <param name="configurator">The configurator for the draggable setting.</param>
        public ListBoxBuilder<T> Draggable(Action<ListBoxDraggableSettingsBuilder<T>> configurator)
        {
            Container.Draggable.Enabled = true;

            Container.Draggable.ListBox = Container;
            configurator(new ListBoxDraggableSettingsBuilder<T>(Container.Draggable));

            return this;
        }

        /// <summary>
        /// Indicates if the widget items can be draged and droped.
        /// </summary>
        public ListBoxBuilder<T> Draggable()
        {
            Container.Draggable.Enabled = true;
            return this;
        }

        /// <summary>
        /// Indicates if the widget items can be draged and droped.
        /// </summary>
        /// <param name="enabled">Enables or disables the draggable option.</param>
        public ListBoxBuilder<T> Draggable(bool enabled)
        {
            Container.Draggable.Enabled = enabled;
            return this;
        }

        /// <summary>
        /// Array of selectors which determines the ListBox widgets that can drag and drop their items to the current ListBox widget. The dropSources option describes one way relationship, if the developer wants a two way connection then the dropSources option should be set on both widgets.
        /// </summary>
        /// <param name="value">The value for DropSources</param>
        public ListBoxBuilder<T> DropSources(params string[] value)
        {
            Container.DropSources = value;
            return this;
        }

        /// <summary>
        /// The height of the listbox. Numeric values are treated as pixels.
        /// </summary>
        /// <param name="value">The value for Height</param>
        public ListBoxBuilder<T> Height(double value)
        {
            Container.Height = value;
            return this;
        }

        /// <summary>
        /// Indicates whether keyboard navigation is enabled/disabled.
        /// </summary>
        /// <param name="value">The value for Navigatable</param>
        public ListBoxBuilder<T> Navigatable(bool value)
        {
            Container.Navigatable = value;
            return this;
        }

        /// <summary>
        /// Indicates whether keyboard navigation is enabled/disabled.
        /// </summary>
        public ListBoxBuilder<T> Navigatable()
        {
            Container.Navigatable = true;
            return this;
        }

        /// <summary>
        /// Indicates whether widget items can be reordered.
        /// </summary>
        /// <param name="value">The value for Reorderable</param>
        public ListBoxBuilder<T> Reorderable(bool value)
        {
            Container.Reorderable = value;
            return this;
        }

        /// <summary>
        /// Indicates whether widget items can be reordered.
        /// </summary>
        public ListBoxBuilder<T> Reorderable()
        {
            Container.Reorderable = true;
            return this;
        }

        /// <summary>
        /// Indicates whether selection is enabled/disabled. Possible values:
        /// </summary>
        /// <param name="value">The value for Selectable</param>
        public ListBoxBuilder<T> Selectable(string value)
        {
            Container.Selectable = value;
            return this;
        }

        /// <summary>
        /// Defines settings for displaing toolbar for current ListBox widget. By default, no toolbar is shown.
        /// </summary>
        /// <param name="configurator">The configurator for the toolbar setting.</param>
        public ListBoxBuilder<T> Toolbar(Action<ListBoxToolbarSettingsBuilder<T>> configurator)
        {

            Container.Toolbar.ListBox = Container;
            configurator(new ListBoxToolbarSettingsBuilder<T>(Container.Toolbar));

            return this;
        }


        
        /// <summary>
        /// Configures the client-side events.
        /// </summary>
        /// <param name="configurator">The client events action.</param>
        /// <example>
        /// <code lang="CS">
        /// @(Html.Kendo().ListBox()
        ///       .Name("ListBox")
        ///       .Events(events => events
        ///           .Change("onChange")
        ///       )
        /// )
        /// </code>
        /// </example>
        public ListBoxBuilder<T> Events(Action<ListBoxEventBuilder> configurator)
        {
            configurator(new ListBoxEventBuilder(Container.Events));
            return this;
        }
        
    }
}

