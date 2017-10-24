{block name="frontend_advisor_sidebar_question_info_text"}
    <div class="mvm">
        <a class="pvm phn" href="#" title="{$advisor['infoLinkText']|truncate:35}" data-toggle="modal" data-target="#myModals">
            <i class="fa fa-question-circle mrs"></i>
            {$advisor['infoLinkText']|truncate:35}
        </a>
    </div>
{/block}

{* Contains the main info for a question, if any is given *}
{block name="frontend_advisor_sidebar_question_info_content"}
    <div class="modal fade" id="myModals" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">{$question['question']}</h4>
                </div>
                <div class="modal-body">
                    {$question['infoText']}
                </div>
            </div>
        </div>
    </div>
{/block}