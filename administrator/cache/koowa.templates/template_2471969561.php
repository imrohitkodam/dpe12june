<?php /**
 * @package     LOGman
 * @copyright   Copyright (C) 2011 Timble CVBA. (http://www.timble.net)
 * @license     GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link        http://www.joomlatools.com
 */
defined('_JEXEC') or die; ?>


<?php if(count($activities)) : ?>
    <?php echo $this->helper('ui.load', array(
        'type'   => 'mod',
        'styles' => array('file' => 'admin-module'))
    ) ?>
    <?php echo $this->helper('behavior.jquery') ?>
    <?php echo $this->helper('behavior.modal')?>

    <div class="logman_container">
        <div class="k-table-container">
            <div class="k-table">
                <table class="logman_table_layout logman_table_layout--list">
                    <tbody>
                    <?php foreach ($activities as $activity) : ?>
                        <tr class="logman_table_layout__item">
                            <td width="1%" class="k-table-data--icon logman_table_layout__icon">
                                <span class="<?php echo $activity->image?>"></span>
                            </td>
                            <td class="k-table-data--multiline logman_table_layout__message">
                                <?php echo $this->helper('activity.activity', array('entity' => $activity, 'scripts' => true))?>
                            </td>
                            <td width="1%" class="k-table-data--right k-table-data--nowrap logman_table_layout__time">
                                <?php echo $this->helper('activity.when', array('entity' => $activity, 'humanize' => true))?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <?php if ($view_all): ?>
            <div class="logman__viewall d-grid p-3">
                <a href="<?php echo JRoute::_('index.php?option=com_logman&view=activities'); ?>" class="btn btn-block btn-secondary"><?php echo $this->translate('View all')?></a>
            </div>
        <?php endif; ?>
    </div>
<?php endif ?>

