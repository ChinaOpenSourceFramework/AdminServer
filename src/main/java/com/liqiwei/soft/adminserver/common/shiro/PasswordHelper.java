package com.liqiwei.soft.adminserver.common.shiro;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

@Component
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
    private String algorithmName = "md5";
    private int hashIterations = 2;

    public void encryptPassword(SysUsers sysUsers) {

    	sysUsers.setSalt(randomNumberGenerator.nextBytes().toHex());

        String newPassword = new SimpleHash(
                algorithmName,
                sysUsers.getPassword(),
                ByteSource.Util.bytes(sysUsers.getCredentialsSalt()),
                hashIterations).toHex();

        sysUsers.setPassword(newPassword);
    }
}
