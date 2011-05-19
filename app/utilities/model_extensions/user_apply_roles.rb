module ModelExtensions
  module UserApplyRoles
    
    def applied_roles
      self.roles
    end
    
    def applied_roles= roles
      self.role_ids = roles
    end
    
  end
end

# the following wont work because this file is autoloaded but not required:
# User.send :include, Extensions::UserApplyRoles