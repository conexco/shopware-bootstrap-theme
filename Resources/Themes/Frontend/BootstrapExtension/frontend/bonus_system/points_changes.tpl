{namespace name="frontend/plugins/bonus_system/index"}

{block name="frontend_bonussystem_changes"}

	{block name="frontend_bonussystem_changes_headline"}
		<h3>{s name="MyPointsChanges"}{/s}</h3>
	{/block}

	{block name="frontend_bonussystem_changes_table"}
		<table class="table tabel-striped table-responsive">
			{block name="frontend_bonussystem_changes_table_head"}
				<thead>
                    <tr>
                        {block name="frontend_bonussystem_changes_table_head_date"}
                            <th>
                                {s name="BonusColumnDate"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_changes_table_head_time"}
                            <th>
                                {s name="BonusColumnTime"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_changes_table_head_type"}
                            <th>
                                {s name="BonusColumnType"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_changes_table_head_reason"}
                            <th>
                                {s name="BonusColumnReason"}{/s}
                            </th>
                        {/block}

                        {block name="frontend_bonussystem_changes_table_head_amount"}
                            <th>
                                {s name="BonusColumnAmount"}{/s}
                            </th>
                        {/block}
                    </tr>
				</thead>
			{/block}

			{block name="frontend_bonussystem_changes_items"}
                <tbody>
                    {foreach $changes as $change}
                        {block name="frontend_bonussystem_changes_item"}
                            {include file="frontend/bonus_system/points_changes_item.tpl"}
                        {/block}
                    {/foreach}
                </tbody>
			{/block}
		</table>
	{/block}
{/block}