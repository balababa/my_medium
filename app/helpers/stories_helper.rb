module StoriesHelper
  def cover_image(story, size = 250)
    image_tag story.cover_image.variant(resize:"#{size}x#{size}"), class: 'story-cover_image'  if story.cover_image.attached?
 end
end
