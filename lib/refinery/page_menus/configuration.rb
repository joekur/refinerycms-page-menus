module Refinery
  module PageMenus
    include ActiveSupport::Configurable

    config_accessor :new_menus, :default_menus, :pages_overview, :collapsible_menu, :show_hidden_pages_in_main_menu,
                    :menu_resources
    
    self.new_menus = false
    self.default_menus = ['sidebar_menu']
    self.pages_overview = true
    self.collapsible_menu = true
    self.show_hidden_pages_in_main_menu = false

    # klass: class type of resource
    # admin_partial: path to partial used in records list
    # title_attr: attribute name (or method name) on resource to be shown as its title
    # admin_page_filter: hash of conditions to be used for filtering objects shown to be add-able via menu edit page
    self.menu_resources = {
      refinery_page: {
        klass: 'Refinery::Page',
        admin_partial: '/refinery/admin/page_positions/page_position',
        title_attr: 'title',
        admin_page_filter: {
          draft: false
        }
      },
      refinery_resource: {
        klass: 'Refinery::Resource',
        admin_partial: '/refinery/admin/resources/resource',
        title_attr: 'file_name'
      }
    }
   
  end
end
