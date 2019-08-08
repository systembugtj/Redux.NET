using System;
using System.Collections.Generic;

using Xamarin.Forms;
using System.Linq;
using Redux.TodoMvc.States;
using Redux.Reactive;

namespace Redux.TodoMvc.Forms
{
    public partial class MainPage : ContentPage
    {
        public MainPage ()
        {
            InitializeComponent ();

            App.Store.ObserveState().Subscribe((ApplicationState state) =>
                {
                    Footer.IsVisible = state.Todos.Any() ? true : false;
                });
        }
    }
}

