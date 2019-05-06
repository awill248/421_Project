new Vue({
    el: '#app',
    data() {
        return {
            email: '',
            password: '',
            status: '',
            msg: ''
        }
    },

    mounted() {        
    },
    methods: {
        login () {            
            axios
                .post('http://localhost:5500/api/login', {email: this.email, password: this.password})
                .then(response => (
                    this.status = response.data.status,
                    (this.status == true) ? window.location = "Preferences.html" : this.msg = 'Login failed!'                                     
                    )                    
                )             
                .catch(function (error) {
                    console.log(error);
                })
            
        }
    }
})