#= require dist/jquery.min
#= require arctic_admin/base
# require ckeditor/init
#= require best_in_place
#= require jquery.purr
#= require best_in_place.purr
#= require new_activeadmin_reorderable
#= require bootstrap.min
#= require dist/js/bootstrap-iconpicker-iconset-all.min
#= require dist/js/bootstrap-iconpicker
$(document).ready ->
  jQuery(".best_in_place").best_in_place()
  addIconPicker();
CKEDITOR_BASEPATH = '/assets/ckeditor/'

