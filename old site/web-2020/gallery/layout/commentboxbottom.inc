<?php /* $Id: commentboxbottom.inc,v 1.15 2004/10/02 20:58:39 jenst Exp $ */ ?>
<?php global $embeddedAlbum, $id, $index ;
if(!$embeddedAlbum == 1)
{
        $url = "add_comment.php?set_albumName={$gallery->album->fields['name']}&id=$id";
?>
                </td>
        </tr>
        </table>

	<input type="button" onClick="javascript:<?php echo popup($url) ?>" value="<?php echo _("add comment") ?>">
	<?php
	if ($gallery->user->canWriteToAlbum($gallery->album)) {
	echo '<input type="submit" value="'. _("Delete marked comments") .'">';
	}
	?>
	</form>
<br>
	</td>
	<td width="20">&nbsp;</td>
<?php } ?>
</tr>
</table>
<br>
