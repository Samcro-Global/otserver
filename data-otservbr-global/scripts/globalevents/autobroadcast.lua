local autoBroadcast = GlobalEvent("AutoBroadcast")
function autoBroadcast.onThink(interval, lastExecution)
    local messages = {
	"Bem Vindos ao Samcro-Global ",
    "[DONATES]: Samcro-Global / @samcroglobal",
	"[FORGE]: As dusts sao adicionadas em sua conta conforme voce for cacando automaticamente.",
	"[INFORMACAO]: Cada 1h Online, Voce recebe 10 event coins, No Qual Voce Pode Trocar Na Store em Tournament",
	"[INFORMACAO]: ATENCAO! Caso o Player Fique 5 dias sem logar, Perde a casa automaticamente!",
	"[DISCORD]: Acesse Nosso Discord : https://discord.gg/AEhkWgPX4j/",
	"[INFORMACAO]: Acesse Nosso Instragram e concorra a sorteios exclusivos! @samcroglobal",
	"[INFORMACAO]: Nao Toleramos falta de respeito com admins, xingamentos, racismo, divulgacao gera em banimento imediato! ",
	"[INFORMACAO]: Duvidas? Sugestoes? Entre em contato com nossa equipe através do discord: https://discord.gg/AEhkWgPX4j/",
    "[COMANDOS]: Digite: !reward, para receber recompensas diárias ",   
	"[COMANDOS]: Digite: !bless, Para Fazer Todas as Bless, Funciona SOMENTE EM AREA PZ! ",
	"[INFORMACAO]: Somos um servidor serio no qual o Staff nao influencia no game, somente para suporte de bugs etc.. entao nao perca seu tempo pedindo items ou para trocar de items!! Pois isso nao faz parte de nossa conduta, Obrigado. ",
	"[FORGE]: Slivers voce podera encontrar as criatuas influenciadas no mapa usando a magia exiva moe res.",
	"[INFORMACAO]: Nao nos Responsabilizamos Por Contas/Items Perdidos Nesse Server, Tome Cuidado Com Quem Voce Anda e o Que Faz!;D ",
	"[INFORMACAO]: Nossa equipe está sempre dedicada para melhor atende-los e manter o servidor em constante atualizações ",
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE)
    return true
end

autoBroadcast:interval(600000) --10 minutes
autoBroadcast:register()