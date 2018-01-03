#CKEDITOR_BASEPATH = '/assets/ckeditor/'
#= require dist/jquery.min
#= require arctic_admin/base
#= require ckeditor/init
#= require best_in_place
#= require jquery.purr
#= require best_in_place.purr
#= require new_activeadmin_reorderable
#= require bootstrap.min
#= require dist/js/bootstrap-iconpicker-iconset-all.min
#= require dist/js/bootstrap-iconpicker.min
$(document).ready ->
  jQuery(".best_in_place").best_in_place()
  jQuery('button[role="iconpicker"],div[role="iconpicker"]').iconpicker({
    align: 'center',
    arrowClass: 'btn-primary',
    arrowPrevIconClass: 'ion-chevron-left',
    arrowNextIconClass: 'ion-chevron-right',
    cols: 6,
    footer: true,
    header: true,
    iconset: 'ionicon',
    labelHeader: '{0} of {1} pages',
    labelFooter: '{0} - {1} of {2} icons',
    placement: 'bottom',
    rows: 3,
    search: true,
    searchText: 'Search',
    selectedClass: 'btn-success',
    unselectedClass: ''
});