{if !empty($thumbnails)}
{strip}{foreach from=$thumbnails item=thumbnail}
<li>
  <a href="{$thumbnail.URL}">
    <img id="gt{$thumbnail.ID}" class="thumbnail" src="{$thumbnail.TN_SRC}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}"
         width="{$thumbnail.TN_WIDTH}" height="{$thumbnail.TN_HEIGHT}" {if empty($thumbnail.TN_SRC)}style="display:none;"{/if}>
  </a>
</li>
{/foreach}{/strip}

{combine_css path="plugins/GThumb/template/gthumb.css"}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js'}
{combine_script id='jquery.ba-resize' path='plugins/GThumb/js/jquery.ba-resize.min.js'}
{combine_script id='gthumb' require='jquery,jquery.ajaxmanager,jquery.ba-resize' path='plugins/GThumb/js/gthumb.js'}

{footer_script require="gthumb"}
GThumb.max_height = {$GThumb.height};
GThumb.margin = {$GThumb.margin};
GThumb.method = '{$GThumb.method}';

{if isset($big_thumb)}
GThumb.small_thumb = {ldelim}id:{$small_thumb.id},src:'{$small_thumb.src}',width:{$small_thumb.width},height:{$small_thumb.height}{rdelim};
GThumb.big_thumb = {ldelim}id:{$big_thumb.id},src:'{$big_thumb.src}',width:{$big_thumb.width},height:{$big_thumb.height}{rdelim};
{/if}

GThumb.build('#thumbnails');
$(window).bind('RVTS_loaded', function() {ldelim} GThumb.build('#thumbnails'); });
{/footer_script}

{html_head}
<style type="text/css">#thumbnails li {ldelim} margin:0 0 {$GThumb.margin}px {$GThumb.margin}px !important; }</style>
{/html_head}
{/if}