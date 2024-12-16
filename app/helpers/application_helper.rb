module ApplicationHelper

  def render_stars(rating)
    full_star = '<span class="star active">★</span>'
    empty_star = '<span class="star">☆</span>'
    (full_star * rating).html_safe + (empty_star * (5 - rating)).html_safe
  end
end
