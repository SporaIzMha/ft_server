/* ****************************************************************************/
/*                       *  *                                                  */
/*                     \______/                           :::      ::::::::   */
/*   config.inc.php                                     :+:      :+:    :+:    */
/*                                                    +:+ +:+         +:+     */
/*   By: spora_iz_mha <marvin@student.42.fr>        +#+  +:+       +#+         */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/26 16:51:36 by marvin            #+#    #+#              */
/*   Updated: 2021/04/26 16:51:36 by marvin           ###   ########.fr       */
/*                                                                             */
/* ****************************************************************************/

<?php
$i = 0;

$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['blowfish_secret'] = 'sporaizmha100500sporaizmha100500';
$cfg['TempDir'] = '/tmp';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

$cfg['DefaultLang'] = 'ru';