module ApplicationHelper
  def custom_paginate(collection, per_page, current_page, total_items, options = {})
    total_pages = (total_items.to_f / per_page).ceil
    current_page = current_page.to_i
    
    # Default options
    options = {
      max_visible_pages: 5,
      container_class: 'pagination justify-content-center',
      page_class: 'page-item',
      link_class: 'page-link',
      active_class: 'active',
      disabled_class: 'disabled'
    }.merge(options)
    
    # Calculate which page numbers to show
    if total_pages <= options[:max_visible_pages]
      # Show all pages if there are fewer than max_visible_pages
      page_range = (1..total_pages).to_a
    else
      # Calculate range of pages to show centered around current page
      half_window = (options[:max_visible_pages] / 2).floor
      start_page = [current_page - half_window, 1].max
      end_page = [start_page + options[:max_visible_pages] - 1, total_pages].min
      
      # Adjust start_page if we're near the end
      if end_page == total_pages
        start_page = [end_page - options[:max_visible_pages] + 1, 1].max
      end
      
      page_range = (start_page..end_page).to_a
    end

    # Generate the HTML
    content_tag :nav, 'aria-label': 'Page navigation' do
      content_tag :ul, class: options[:container_class] do
        html = ''.html_safe
        
        # Previous button
        html += content_tag :li, class: "#{options[:page_class]} #{current_page <= 1 ? options[:disabled_class] : ''}" do
          if current_page <= 1
            content_tag :span, 'Previous', class: options[:link_class]
          else
            link_to 'Previous', yield(current_page - 1), class: options[:link_class]
          end
        end
        
        # Page numbers
        page_range.each do |page|
          html += content_tag :li, class: "#{options[:page_class]} #{page == current_page ? options[:active_class] : ''}" do
            if page == current_page
              content_tag :span, page, class: options[:link_class]
            else
              link_to page, yield(page), class: options[:link_class]
            end
          end
        end
        
        # Next button
        html += content_tag :li, class: "#{options[:page_class]} #{current_page >= total_pages ? options[:disabled_class] : ''}" do
          if current_page >= total_pages
            content_tag :span, 'Next', class: options[:link_class]
          else
            link_to 'Next', yield(current_page + 1), class: options[:link_class]
          end
        end
        
        html
      end
    end
  end
  
  def flickr_image_url(photo, size = 'c')
    if photo.present? && photo['server'].present? && photo['id'].present? && photo['secret'].present?
      "https://live.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_#{size}.jpg"
    else
      "https://placehold.co/400x300?text=No+Image"
    end
  end

  def flickr_resource_url(photo)
    url = "https://www.flickr.com/photos/#{photo['owner']['nsid']}/#{photo['id']}"
  end
end