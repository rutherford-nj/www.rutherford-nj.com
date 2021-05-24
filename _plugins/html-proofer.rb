require "html-proofer"

Jekyll::Hooks.register :site, :post_write do |site|
  HTMLProofer.check_directory(site.config["destination"], opts = {
    :check_favicon => true,
    :check_html => true,
    :disable_external => true,
    :only_4xx => true,
    :file_ignore => [/.*tmpl.*/],
    :alt_ignore => [
      "/static/images/health.png",
      "/static/images/megaphone.png",
      "borough-hall-govt.jpg",
      "mayor-and-council.jpg",
      "photo-gallery.png",
      "resident-information.jpg",
    ],
  }).run
end
