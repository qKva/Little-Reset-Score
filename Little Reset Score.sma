/*

     Плагин: Little Reset Score
     Автор плагина: qKva | qkvander

     Ссылка на плагин:
     - https://github.com/qKva/Little-Reset-Score

     В дальнейшем все новости обновления будут по ссылке выше, хотя
     на них не рассчитывайте, плагин не востребован.

     Ссылки на автора:
     - https://github.com/qKva
     - https://vk.com/qkvander

     О плагине:
     - Крохотная версия обнулия счёта на серверах.
     - Будет полезен на модах: GG, Public, CSDM, KnifeDM и остальных.

     Примечание:
     - Для вызова на вашем сервере достаточно написать в чат то, что
     вы зарегистрировали или прописать в консоль.
     - При использовании в вашем меню воспользуйтесь - client_print(id, "команда").

     - Для интеграции в мод/плагин скопируйте иклюды/регистрацию команды
     и паблик консольной команды.
     - Для вызова команды воспользуйтесь - client_cmd(id, "команда")

     
*/

#include <amxmodx>
#include <amxmisc>
#include <cstrike>
#include <fun>

new pcvar_rsdisplay;

public plugin_init()
{
     register_plugin("Little Reset Score", "1.0", "qKva");

     register_clcmd("say /rs", "ClCmd_ResetScore"); // Писать в чат без 'say' или в консоль с 'say'
     register_clcmd("rs", "ClCmd_ResetScore"); // Писать в консоль

     // Закоментируйте/сотрите, если вам не нужна информация об обнулении в чате.
     pcvar_rsdisplay = register_cvar("sv_rsdisplay", "0");
}

public ClCmd_ResetScore(id)
{
	set_user_frags(id, 0);
	cs_set_user_deaths(id, 0);

     // Закоментируйте/сотрите, если вам не нужна информация об обнулении в чате.
     if(get_pcvar_num(pcvar_rsdisplay) == 1)
	{
		new name[33];
		get_user_name(id, name, 32);

		client_print(0, print_chat, "[LRS] %s обновил счёт убийств и смертей.", name);
	}
	else
	{
		client_print(id, print_chat, "[LRS] Ваш счёт убийств и смертей обновлён!");
	}
}